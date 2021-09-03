
module "omni-postgres" {
  source               = "../../modules/sql/"
  name                 = "pg-db-omnt-dev"
  project_id           = "ecstatic-backup-319018"
  database_version     = "POSTGRES_13"
  region               = "us-central1"

  deletion_protection = false

  // Master configurations
  tier                            = "db-custom-2-13312"
  zone                            = "us-central1-c"
  availability_type               = "ZONAL"
  maintenance_window_day          = 7
  maintenance_window_hour         = 12
  maintenance_window_update_track = "stable"

  ip_configuration = {
    ipv4_enabled    = false
    require_ssl     = true
    private_network = "projects/ecstatic-backup-319018/global/networks/test-ingress"
    authorized_networks = []

  }

  backup_configuration = {
    enabled                        = false
    binary_log_enabled             = false
    start_time                     = "20:55"
    location                       = null
    transaction_log_retention_days = null
    retained_backups               = 365
    retention_unit                 = "COUNT"
    point_in_time_recovery_enabled  = false
  }


  disk_type    = "PD_HDD"
  user_labels  = { bar = "baz" }

  db_name      = "default-1"
  db_charset   = "utf8mb4"
  db_collation = "utf8mb4_general_ci"

  user_name     = "tftest"
  user_password = "foobar"


}