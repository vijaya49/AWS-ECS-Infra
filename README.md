# 🚀 Build and Deploy to AWS ECS

This repository contains a GitHub Actions workflow to **automatically build, scan, and deploy** a Docker image to **Amazon ECS** whenever:
- A `push` is made to the `main` branch, or
- A `repository_dispatch` event is triggered from another repository.

---

## 🔁 Triggered By

- `push` to `main`
- `repository_dispatch` event with type: `trigger-docker-build`

This allows external repositories (like `vijaya49/Static-Web-Host-Dev`) to trigger the build and deployment process.

---

## 📋 Workflow Overview

### 🧱 Steps

1. **Checkout** this repo and the source repo (`Repo A`)
2. **Configure AWS credentials** using secrets
3. **Login to Amazon ECR**
4. **Build Docker image** from `Repo A` source code
5. **Scan image** for vulnerabilities using [Trivy](https://github.com/aquasecurity/trivy)
6. **Tag and push image** to ECR with `latest` and short SHA tag
7. **Setup and run Terraform** to deploy the updated image to ECS

---

## 🔐 Required Secrets

Set the following secrets in your repository:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `REPO_B_PAT`: Personal access token with permission to access Repo A

---

## 🧪 Tools Used

- [GitHub Actions](https://github.com/features/actions)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Trivy](https://github.com/aquasecurity/trivy)
- [Terraform](https://www.terraform.io/)

---

## 📘 Related

- Triggering Repo: [`vijaya49/Static-Web-Host-Dev`](https://github.com/vijaya49/Static-Web-Host-Dev)
- Trigger Event: `repository_dispatch` → `trigger-docker-build`
