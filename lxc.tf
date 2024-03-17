// Get secrets from infisical
data "infisical_secrets" "backend-secrets" {
  env_slug    = "prod"
  folder_path = "/"
}

// LXC configuration
resource "proxmox_lxc" "lxc-test" {
  target_node  = var.target_node
  hostname     = var.hostname
  ostemplate   = var.ostemplate
  unprivileged = false
  password     = var.password
  ostype       = var.ostype
  cores        = 2
  memory       = 2012
  swap         = 512
  vmid         = var.vmid

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  nameserver   = var.nameserver   // DNS Settings
  searchdomain = var.searchdomain // DNS Settings

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = var.ip
    ip6      = "dhcp"
    gw       = var.gateway
    firewall = true
    tag      = var.pve_id_tag
  }
}