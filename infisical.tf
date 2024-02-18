# Manage Secrets
resource "infisical_secret" "pm_api_token" {
  name        = "PM_API_TOKEN"
  value       = var.pm_api_token_secret
  env_slug    = "prod"
  folder_path = "/"
}

resource "infisical_secret" "pm_api_token_id_usr" {
  name        = "PM_API_TOKEN_ID"
  value       = var.pm_api_token_id
  env_slug    = "prod"
  folder_path = "/"
}

resource "infisical_secret" "password" {
  name        = "LXC_PASS"
  value       = var.password
  env_slug    = "prod"
  folder_path = "/"
}

resource "infisical_secret" "service_token" {
  name        = "TOKEN"
  value       = var.service_token
  env_slug    = "prod"
  folder_path = "/"
}

resource "infisical_secret" "host" {
  name        = "HOST"
  value       = var.infisical_host
  env_slug    = "prod"
  folder_path = "/"
}

resource "infisical_secret" "pm_api_url" {
  name        = "PM_API_URL"
  value       = var.pm_api_url
  env_slug    = "prod"
  folder_path = "/"
}

