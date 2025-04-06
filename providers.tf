terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc8"
    }
    infisical = {
      source = "infisical/infisical"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure     = true
  pm_api_url          = var.pm_api_url
  pm_api_token_secret = var.pm_api_token_secret
  pm_api_token_id     = var.pm_api_token_id
}

provider "infisical" {
  host          = var.infisical_host
  service_token = var.service_token
}
