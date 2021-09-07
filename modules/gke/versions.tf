terraform {
  required_version = ">=0.13"

  required_providers {


    google = {
      source  = "hashicorp/google"
      version = "> 3.77.0, <4.0.0"
     
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}