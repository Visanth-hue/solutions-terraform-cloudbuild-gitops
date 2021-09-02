data "google_compute_network" "private-network" {
  name = "test-ingress"
}



module "omni-postgres" {
  source                          = "../../modules/sql/"
  project = var.project
  name                = pg-dev-omni
  database_version    = "POSTGRES_13"
  region              = "europe-west1"

  ip_configuration = {
    ipv4_enabled        = false
    private_network     = "test-ingress"
    require_ssl         = true
    authorized_networks = var.authorized_networks
  }