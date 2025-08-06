# Zusammenfassung

## Datenbank

- Die Datenbank sollte für eine produktive Anwendung als gegeben gesehen werden, bzw. in einem separaten Projekt aufgesetzt und betrieben werden.
- Das Aufsetzen einer produktiven PostgreSQL Datenbank sprengt den Rahmen dieser Aufgabe.

## Backend

- Das Backend (Java, Spring Boot, Maven) wurde über eine Pipeline gebaut, getestet und gepusht
- In PullRequests kann das Outcome der build und test stage integriert werden und als check hinzugefügt werden
- Das Deployment findet vollständig automatisiert über ArgoCD statt
- Der Helm Chart, der das Backend packaged, wird automatisiert gebaut und gepublished. Über eine Helm Value kann die jeweilige Version des Images des BE gesetzt werden.

## Frontend

- Das Frontend (Angular, npm) wurde über eine Pipeline gebaut, getestet und gepusht
- In PullRequests kann das Outcome der build und test stage integriert werden und als check hinzugefügt werden
- Das Deployment findet vollständig automatisiert über ArgoCD statt
- Der Helm Chart, der das Frontend packaged, wird automatisiert gebaut und gepublished. Über eine Helm Value kann die jeweilige Version des Images des BE gesetzt werden.

## Beispiel

### Backend

```yaml
replicaCount: 2

image:
  repository: gcr.io
  image: demo/backend
  version: 1.0.0

ingress:
  enabled: true
  className: nginx

  hosts:
    - host: backend.prod.demo.cloud
      paths:
        - path: /
          pathType: ImplementationSpecific

# Konfiguration der Datenbank
env:
  PG_HOST: ${pg_host}
  PG_PORT: ${pg_port}
  PG_DB: ${pg_db}
  PG_USERNAME: ${pg_username}
  PG_PASSWORD: ${pg_password}
```

### Frontend

```yaml
replicaCount: 2

image:
  repository: gcr.io
  image: demo/frontend
  version: 1.0.0

ingress:
  enabled: true
  className: nginx

  hosts:
    - host: frontend.prod.demo.cloud
      paths:
        - path: /
          pathType: ImplementationSpecific

# Konfiguration des BE
env:
  BE_URL: https://backend.staging.demo.cloud
```
## Abschluss

Anschließend muss gesagt werden, dass die vorliegende Aufgabe sehr viel Platz für Interpretationen lässt.
Auch sind zu 100% die Helm Charts oder die finalen Deployments nicht produktionsreif und müssen durch eine Reihe von Tests und Verfeinerungen.
Nicht zu vergessen ist auch, dass dies eine rein theoretische Arbeit ist und nicht getestet ist.

## Ausblick

Um eine vollumfängliche produktive Landschaft zu schaffen, fehlen an vielen Ecken und Kanten Dinge.

- SAST bzw. Code Quality Analysen während Build (Snyk, Sonar, Codacy, ...)
- Secret Management (Hashicorp Vault, Sealed Secrets, ...)
- Monitoring (Metriken, Traces, Alerting)
- Log Collection (Zentrales Logging)
- Sicherheitsmechanismen (Network Policies, ...)
- Scheduling Mechanismen (Priority Classes, Affinity)