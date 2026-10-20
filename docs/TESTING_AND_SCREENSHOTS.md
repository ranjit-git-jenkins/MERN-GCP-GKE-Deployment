# Testing and screenshot checklist
Capture your own real evidence after running each step:
1. `terraform validate` and `terraform plan` terminal output.
2. `gcloud container clusters list` showing GKE cluster.
3. `gcloud artifacts docker images list REGION-docker.pkg.dev/PROJECT/REPO`.
4. `helm lint helm/mern-gke` and `helm list -n mern`.
5. `kubectl get nodes` and `kubectl get pods,svc -n mern`.
6. Browser screenshot of working application, plus functional API checks.
7. `kubectl describe` / logs for troubleshooting, if needed.
Do not fabricate screenshots. Redact credentials, tokens, project-sensitive information. No live execution is claimed by this package.
