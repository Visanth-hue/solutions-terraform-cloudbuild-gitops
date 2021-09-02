module "omni-postgres" {
  source                          = "../../modules/sql/"
  project = var.project
  name                = pg-dev-omni
  database_version    = "POSTGRES_13"
  region              = "europe-west1"
  private_network = "test-ingress"