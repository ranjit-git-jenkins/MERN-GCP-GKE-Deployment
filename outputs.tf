output "cluster_name" { value = google_container_cluster.gke.name }
output "cluster_location" { value = google_container_cluster.gke.location }
output "get_credentials" { value = "gcloud container clusters get-credentials ${google_container_cluster.gke.name} --region ${var.region} --project ${var.project_id}" }
