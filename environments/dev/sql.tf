data "google_compute_network" "private-network" {
  name = "test-ingress"
}



module "omni-postgres" {
  source                          = "../../modules/sql/"
  project = var.project
  name                = pg-dev-omni
  database_version    = "POSTGRES_13"
  region              = "europe-west1"
  private_network = google_compute_network.private_network.id