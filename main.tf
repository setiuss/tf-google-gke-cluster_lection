resource "google_container_cluster" "demo" {
  name     = "demo-cluster"
  location = var.GOOGLE_REGION

  remove_default_node_pool = true # delete default pool
  initial_node_count       = 1
}

# create castom pool
resource "google_container_node_pool" "main" {
  name       = "main"
  project    = google_container_cluster.demo.project
  cluster    = google_container_cluster.demo.name
  location   = google_container_cluster.demo.location
  node_count = var.GKE_NUM_NODES

  node_config {
    machine_type = var.GKE_MACHINE_TYPE
  }
}

module "gke_cluster" {
  source         = "github.com/setiuss/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = 2
}