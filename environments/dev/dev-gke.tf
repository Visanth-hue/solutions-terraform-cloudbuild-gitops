module "gke-dev-cluster-sa" {
  source = "../../modules/sa"

  project_id      = "extreme-325013"
  name   = "gke-ostr-dev"

}

// This file contains the gke-dev cluster resource definitions

resource "google_service_account" "cluster_service_account" {
  project      = "extreme-325013"
  account_id   = "tf-gke-dev"
  display_name = "Terraform-managed service account for cluster dev"
}

// create sa for dev cluster

module "gke-dev-ostr" {
  source                            = "../../modules/gke/"
  project_id                        = "extreme-325013"
  name                              = "gke-ostr-dev"
  regional                          = false
  region                            = "europe-west1"
  zones                             = ["europe-west1-b", "europe-west1-c"]
  network_project_id                = "service-325013"
  network                           = "shared-vpc"
  subnetwork                        = "dev"
  ip_range_pods                     = "pods"
  ip_range_services                 = "services"
  release_channel                   = "STABLE"
  create_service_account            = true
  disable_legacy_metadata_endpoints = false
  enable_private_endpoint           = true
  enable_private_nodes              = true
  master_ipv4_cidr_block            = "172.16.20.0/28"

  authenticator_security_group      = "gke-security-groups@vasivas.com"

  remove_default_node_pool          = true
  initial_node_count                = 1

  default_max_pods_per_node         = 32


  node_pools = [
    {
      name                      = "pool-01"
      machine_type              = "e2-medium"
      node_locations            = "europe-west1-b,europe-west-c"
      min_count                 = 1
      max_count                 = 2
      local_ssd_count           = 0
      disk_size_gb              = 30
      disk_type                 = "pd-standard"
      image_type                = "cos_containerd"
      auto_repair               = true
      auto_upgrade              = true
      preemptible               = false
    },

    { 
      name                      = "pool-02"
      machine_type              = "e2-medium"
      node_locations            = "europe-west1-b,europe-west-c"
      min_count                 = 1
      max_count                 = 2
      local_ssd_count           = 0
      disk_size_gb              = 30
      disk_type                 = "pd-standard"
      image_type                = "cos_containerd"
      auto_repair               = true
      auto_upgrade              = true

      },


  ]

  node_pools_oauth_scopes = {
    all = [
        "https://www.googleapis.com/auth/cloud-platform",
    ]

  }

  node_pools_labels = {
    all = {
        env = "dev"
    }
  }

  node_pools_metadata = {
    all = {}

  }

  node_pools_taints = {
    all = []

  }

  node_pools_tags = {
    all = [
        "allow-health-checks"
    ]


  }
}