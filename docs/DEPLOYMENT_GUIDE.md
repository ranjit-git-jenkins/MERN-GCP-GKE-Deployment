# GKE Deployment Guide (CLI, no Console GUI)
Prerequisites: GCP project with billing, IAM permissions, gcloud CLI, Docker, kubectl, Helm, Terraform. Authentication is still required.

```bash
gcloud auth login
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
gcloud services enable artifactregistry.googleapis.com
# Create the Artifact Registry Docker repository (one-time)
gcloud artifacts repositories create mern-images --repository-format=docker --location=asia-south1 --description="MERN container images"
cd terraform
cp terraform.tfvars.example terraform.tfvars
# Edit project_id and settings
terraform init && terraform fmt -check && terraform validate && terraform plan
terraform apply
cd ..
gcloud container clusters get-credentials mern-gke --region asia-south1 --project YOUR_PROJECT_ID
export PROJECT_ID=YOUR_PROJECT_ID REGION=asia-south1 REPOSITORY=mern-images IMAGE_TAG=v1
bash scripts/build-push.sh
helm lint helm/mern-gke
helm upgrade --install mern helm/mern-gke -n mern --create-namespace --set images.registry="$REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY" --set images.tag="$IMAGE_TAG"
bash scripts/validate.sh
```

**Review before execution:** Dockerfiles are templates and the build contexts must match your source. GKE nodes must be permitted to pull Artifact Registry images. Validate frontend proxy/API routes, database persistence, and secrets before real use. Use `terraform destroy` only when safe; it deletes provisioned infrastructure. Costs apply.
