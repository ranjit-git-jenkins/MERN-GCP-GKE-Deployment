variable "project_id" { type = string }
variable "region" { type = string default = "asia-south1" }
variable "cluster_name" { type = string default = "mern-gke" }
variable "network_name" { type = string default = "mern-gke-vpc" }
variable "node_count" { type = number default = 1 }
variable "machine_type" { type = string default = "e2-standard-2" }
