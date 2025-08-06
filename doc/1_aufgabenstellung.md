# Aufgabenstellung

Ihre Aufgabe ist eine beispielhafte Webanwendung bestehend aus Frontend, Backend und
DB in einen Kubernetes Cluster zu deployen. Welche Kubernetes Ressourcen werden dafür
benötigt und wie sähe Ihr Deployment aus? Die Anwendung soll automatisiert mittels CI/CD
Pipelines deployt werden. Bitte skizzieren Sie die nötigen Pipeline Stages und Tasks.

## Short

- beispielhafte Webanwendung bestehend aus Frontend, Backend und DB in einen Kubernetes Cluster
- Welche Kubernetes Ressourcen werden dafür benötigt
- wie sähe Ihr Deployment aus
- automatisiert mittels CI/CD Pipelines deployt
- skizzieren Sie die nötigen Pipeline Stages und Tasks

## Annahmen

- Existierendes K8S Cluster --> `kubeconfig` mit administrativem Access
- Für produktives Beispiel:
    - Domain
    - Cert Manager bzw. entsprechende Zertifikate
    - Persistenter Storage

| Komponente         | Produktiv | Local                                                                                 |
|--------------------|-----------|---------------------------------------------------------------------------------------|
| Domain             | ...       | \*.127.0.0.1.sslip.io                                                                 |
| Persistent Storage | ...       | [Rancher / Local Path Provisioner](https://github.com/rancher/local-path-provisioner) |