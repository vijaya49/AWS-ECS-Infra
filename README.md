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


# 🚀 Terraform Operations Workflow

This repository uses GitHub Actions to automate Terraform operations such as `plan`, `apply`, and `destroy`.

## Workflow Triggers

The workflow is defined in `.github/workflows/terraform.yml` and supports the following triggers:

- **Push to `main` branch** – Runs Terraform Plan.
- **Pull Requests** – Runs Terraform Plan.
- **Manual Dispatch (`workflow_dispatch`)** – Runs either `terraform apply` or `terraform destroy`, based on user input.

## Manual Trigger

To trigger a manual workflow (via the GitHub UI):

1. Navigate to the "Actions" tab.
2. Select **Terraform Operations** workflow.
3. Click **Run workflow**.
4. Choose the action:
   - `apply` – Applies the Terraform changes.
   - `destroy` – Destroys the Terraform-managed infrastructure.

> ⚠️ Only `apply` and `destroy` are accepted as inputs.

## Secrets Configuration

The workflow depends on the following GitHub secrets (set under repository settings → Secrets and variables → Actions):

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

These credentials should have appropriate permissions for managing AWS resources using Terraform.

## Workflow Jobs

### 1. Terraform Plan
Runs on every push to `main` or on a pull request.

Steps:
- Checks out the code.
- Configures AWS credentials.
- Sets up Terraform.
- Initializes Terraform.
- Formats and validates Terraform code.
- Generates an execution plan.

### 2. Terraform Apply
Triggered manually with `apply` input.

Steps:
- Checks out the code.
- Configures AWS credentials.
- Sets up Terraform.
- Initializes Terraform.
- Applies changes automatically with `-auto-approve`.

### 3. Terraform Destroy
Triggered manually with `destroy` input.

Steps:
- Checks out the code.
- Configures AWS credentials.
- Sets up Terraform.
- Initializes Terraform.
- Destroys infrastructure automatically with `-auto-approve`.

## Terraform Version

The workflow uses **Terraform 1.10.5**. You can change this version by editing the `terraform_version` input in the workflow file.



