output "lxc_ip_address" {
  value       = proxmox_lxc.lxc-test.network[0].ip
  description = "The IP address of the LXC container"
}

output "lxc_dns_server" {
  value       = proxmox_lxc.lxc-test.nameserver
  description = "DNS server"
}

output "lxc_hostname" {
  value       = proxmox_lxc.lxc-test.hostname
  description = "hostname of lxc container"
}

output "vmid" {
  value       = proxmox_lxc.lxc-test.vmid
  description = "VMID of lxc container"
}

output "ostype" {
  value       = proxmox_lxc.lxc-test.ostype
  description = "OS type of lxc container"
}