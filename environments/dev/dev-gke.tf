module "gke-dev-cluster-sa" {
  source = "../../modules/sa"

  project_id      = "extreme-325013"
  name   = "gke-ostr-dev"
  display_name = "Terraform-managed service account for cluster ostr dev"   

}