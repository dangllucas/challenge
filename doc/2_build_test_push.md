# Bearbeitung

Start: 06.08.2025 17:00 Uhr
Ende: 06.08.2025 20:00 Uhr

## Planung

#### Backend Annahme:
- Java
- Spring Boot
- Maven

#### Frontend Annahme:
- Angular
- Npm

### Build

Environment Variables:
- REGISTRY: Die Image Registry
- REPOSITORY: Die Image Repository
- IMAGE_NAME: Der Image Name
- IMAGE_TAG: Der Image Tag

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
- Ausführung von Helm Linting `helm lint` (in Helm Chart Ordner)

### Push

#### Backend & Frontend
- Push über `docker push "${REGISTRY}/${REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}"`

#### Helm Charts
- Push über `helm push ${CHART_NAME}-${CHART_VERSION}.tgz oci://${REGISTRY}/${REPOSITORY}`
