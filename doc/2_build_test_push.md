# Bearbeitung

Start: 06.08.2025 16:03 Uhr
Ende: 

## Planung

#### Backend Annahme:
- Java
- Spring Boot
- Maven

#### Frontend Annahme:
- Angular
- Npm

### Build

#### Backend
- Mit Spring Boot Maven Plugin: `./mvnw spring-boot:build-image`
- Separates Dockerfile und build. Siehe [build.sh](../backend/build.sh) & [Dockerfile](../backend/Dockerfile) 

#### Frontend
- Multistage Dockerfile und build. Siehe [build.sh](../frontend/build.sh) & [Dockerfile](../frontend/Dockerfile)

#### Helm Charts
- Sowohl Backend als auch Frontend haben ihre eigenen Helm Charts. Diese müssen ebenfalls gepackaged werden.
- `helm package helm/ --version ${CHART_VERSION}`

### Test

#### Backend
- Ausführung von Tests über `./mvnw test`
- Wird automatisch durch den Build ausgeführt

#### Frontend
- Ausführung von Unittests über `npm run test`
- Ausführung von End-2-End Tests über `npm run e2e`

#### Helm Charts
- Ausführung von Helm Linting `helm lint`

### Push
- 

### Deployment

- Mir persönlich wäre es am liebsten ein GitOps Tooling, wie ArgoCD, zu verwenden.
- In dieser Aufgabe allerdings noch ein komplettes GitOps Tooling aufzusetzen würde den Rahmen sprengen.
- 

## Anmerkungen

- ArgoCD
  - ArgoCD sollte als zentrale Instanz auf einem separaten Kubernetes Cluster betrieben werden.
  - Ebenfalls kann so ArgoCD für verschiedenste Projekte / Services verwendet werden. Die Deployment Target Cluster für ArgoCD können festgelegt werden.
- Datenbank
  - Ich persönlich würde eine Datenbank immer als separate Komponente betreiben und nicht als DB für ein Projekt betreiben.
  - Dadurch entsteht eine zentrale DB, die von mehreren Services verwendet werden kann. Der Betrieb der DB lässt sich so durch "Experten" sicherstellen und landet nicht in der Verantwortung von Entwicklern.
  - Zentrales Management von Snapshots / Backups und mögliches Disaster Recovery.
