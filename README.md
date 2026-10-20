# MERN Microservices on Google Kubernetes Engine (GKE)

**Original application:** https://github.com/UnpredictablePrashant/SampleMERNwithMicroservices  
**Submission repository:** https://github.com/ranjit-git-jenkins/SampleMERNwithMicroservices

This is a **GKE-ready infrastructure and deployment overlay**, not a record of a completed live GCP deployment. Preserve your existing `frontend/` and `backend/` application source folders. Review Docker build paths against your source tree before use.

## Components
React frontend; Node.js `helloService` (3001); Node.js `profileService` (3002); MongoDB (development-only in-cluster example). Terraform creates a VPC, subnet, GKE Standard cluster and node pool. Helm deploys application workloads and services.

## Quick start
1. Review `docs/DEPLOYMENT_GUIDE.md` and `docs/ARCHITECTURE.md`.
2. Authenticate: `gcloud auth login`, `gcloud auth application-default login`, and set your project.
3. Configure `terraform/terraform.tfvars` from `terraform.tfvars.example` and run `terraform init`, `terraform validate`, `terraform plan`, `terraform apply`.
4. Run `gcloud container clusters get-credentials CLUSTER --region REGION --project PROJECT`.
5. Build/push images using `scripts/build-push.sh` after setting `PROJECT_ID`, `REGION`, `REPOSITORY`, `IMAGE_TAG` and verifying Docker build contexts.
6. Deploy: `helm upgrade --install mern ./helm/mern-gke --namespace mern --create-namespace --set images.registry=REGION-docker.pkg.dev/PROJECT/REPOSITORY --set images.tag=TAG`.
7. Validate: `bash scripts/validate.sh`; capture real screenshots following `docs/TESTING_AND_SCREENSHOTS.md`.

**Important:** Live GKE creation requires GCP billing, IAM permissions and authentication; no Cloud Console GUI is required. Do not present unrun commands or placeholders as verified deployment evidence. Terraform resources may incur charges.
