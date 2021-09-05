module "gke-dev-cluster-sa" {
  source = "../../modules/sa"

  project      = "extreme-325013"
  account_id   = "tf-gke-ostr-dev"
  display_name = "Terraform-managed service account for cluster ostr dev"   

}