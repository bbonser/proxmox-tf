// Variables set for provider access
variable "pm_api_url" {
  type      = string
  sensitive = true
}

variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}

variable "pm_api_token_id" {
  type      = string
  sensitive = true
}

variable "infisical_host" {
  type      = string
  sensitive = true
}

variable "service_token" {
  type      = string
  sensitive = true
}

// LXC variables for basic ubuntu VM
variable "target_node" {
  description = "node in proxmox"
  type        = string
  default     = "pve"
}

variable "ostemplate" {
  description = "Operating System template"
  type        = string
  default     = "local:vztmpl/ubuntu-23.04-standard_23.04-1_amd64.tar.zst"
}

variable "ostype" {
  type    = string
  default = "ubuntu"
}

variable "hostname" {
  type    = string
  default = "lxc-test"
}

variable "password" {
  type      = string
  sensitive = true
}

variable "vmid" {
  description = "VM ID in Proxmox"
  type        = number
  default     = 108
}

variable "ip" {
  type    = string
  default = "192.168.1.18/24"
}

variable "pve_id_tag" {
  description = "VLAN tag"
  type        = number
  default     = 1
}

variable "gateway" {
  description = "Gateway address"
  type        = string
  default     = "192.168.1.1" // modify to your router address
}

variable "nameserver" {
  description = "DNS Server"
  type        = string
  default     = "192.168.1.13" // modify to your DNS server address
}

variable "searchdomain" {
  description = "DNS Search Domain"
  type        = string
  default     = "192.168.1.13" // modify to your DNS server address
}

variable "sshkey" {
  type = string
  sensitive = true
}