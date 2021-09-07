terraform {
  required_version = ">=0.13"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.39.0, <4.0.0"
    }

    google = {
      source  = "hashicorp/google"
      version = "> 3.77.0, <4.0.0"
      configuration_aliases = [ google.alternate ]
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}