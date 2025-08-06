# Deployment

## Anmerkungen

- Mir persönlich wäre es am liebsten ein GitOps Tooling, wie ArgoCD, zu verwenden.
- In dieser Aufgabe allerdings noch ein komplettes GitOps Tooling aufzusetzen würde den Rahmen sprengen.

Die Variablen in `${}` sind als Dokumentations Placeholder zu verstehen. Diese sollten natürlich durch konkrete Werte ersetzt werden, bevor diese Dokumentation umgesetzt wird.
Vor allem im argo application set kann dies zu Verwirrung führen. 

Variablen in `{|}` verstehen sich als: entweder | oder

## Allgemeines

- Deployment findet über Helm Charts statt.
  - Möglichkeiten:
    - Händisch:
      ```shell
      helm repo add oci://${REGISTRY}
      helm registry login ${REGISTRY}
      helm upgrade --install {backend|frontend} oci://${REGISTRY}/${REPOSITORY}/${CHART_NAME} \
          --version ${CHART_VERSION} \
          --namespace {backend|frontend} \
          --create-namespace \
          --values {path_to_values_file}
      ```
    - Automatisiert über Pipeline [hier](4_ci_cd.md)
    - Über ArgoCD: [YAML](argo_application_set.yaml)
## Datenbank

- Das Backend benötigt eine DB. Diese sollte entweder händisch mit Helm installiert werden oder ebenfalls als ArgoCD Application gepflegt werden.
- Hierfür sollte der offizielle Postgres CloudNative Operator verwendet werden: https://cloudnative-pg.io/ (Bitnami hat ja kürzlich beschlossen, hier Geld zu verlangen :/)
- Installation:
  - Manuell:
    ```shell
    helm repo add cnpg https://cloudnative-pg.github.io/charts
    helm upgrade --install cnpg \
      --namespace cnpg-system \
      --create-namespace \
      cnpg/cloudnative-pg
    ```
  - ArgoCD: Vergleiche Oben
- Anmerkung:
  - Komplexe Installation und Wartung
  - Ich persönlich würde eine Datenbank immer als separate Komponente betreiben und nicht als DB für ein Projekt betreiben.
  - Dadurch entsteht eine zentrale DB, die von mehreren Services verwendet werden kann. Der Betrieb der DB lässt sich so durch "Experten" sicherstellen und landet nicht in der Verantwortung von Entwicklern.
  - Zentrales Management von Snapshots / Backups und mögliches Disaster Recovery.