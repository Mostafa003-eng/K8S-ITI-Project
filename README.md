# 🗳️ Kubernetes Voting App

This project deploys the classic **Docker Voting App** on a local Kubernetes cluster using **Minikube**. It includes Redis, PostgreSQL, a voting frontend, a result app, and a worker – all running inside a Kubernetes namespace with resource quotas.

---

## 📦 Components

| Component       | Description                      | Image                                                |
|----------------|----------------------------------|------------------------------------------------------|
| Redis           | Stores votes temporarily         | `redis`                                              |
| PostgreSQL      | Stores final vote counts         | `postgres`                                           |
| Voting App      | Frontend to cast votes           | `docker/example-voting-app-vote`                    |
| Result App      | Frontend to show vote results    | `docker/example-voting-app-result`                  |
| Worker          | Moves data from Redis to Postgres| `docker/example-voting-app-worker`                  |

---

## 🚀 Getting Started

### ✅ Requirements:

- Ubuntu / Linux
- [Docker](https://docs.docker.com/engine/install/)
- [Minikube](https://minikube.sigs.k8s.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)

---

## ⚙️ Usage

### 🟢 Start the cluster and deploy everything:

```bash
./deploy.sh
