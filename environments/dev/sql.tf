data "google_compute_network" "private-network" {
  name = "test-ingress"
}



module "omni-postgres" {
  source                          = "../../modules/sql/"
  project_id = var.project_id
  name       = "pg-dev-omni"
  database_version    = "POSTGRES_13"
  region              = "europe-west1"
  zone = "europe-west1-b"

  ip_configuration = {
    ipv4_enabled        = false
    private_network     = "test-ingress"
    require_ssl         = true
  }
}