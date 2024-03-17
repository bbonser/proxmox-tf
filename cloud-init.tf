resource "proxmox_vm_qemu" "cloudinit-k3s-master" {
  # Node name has to be the same name as within the cluster
  # this might not include the FQDN
  target_node = "pve"
  desc        = "Cloudinit Ubuntu"
  count       = 2
  onboot      = false

  # The template name to clone this vm from
  clone = "ubuntu-cloud"

  # Activate QEMU agent for this VM
  agent = 0

  os_type = "cloud-init"
  cores   = 2
  sockets = 2
  numa    = true
  vcpus   = 0
  cpu     = "host"
  memory  = 4096
  name    = "k3s-master-0${count.index + 1}"

  cloudinit_cdrom_storage = "local-lvm"
  scsihw                  = "virtio-scsi-single"
  bootdisk                = "scsi0"

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = 12
        }
      }
    }
  }

  # Setup the ip address using cloud-init.
  # Keep in mind to use the CIDR notation for the ip.
  ipconfig0  = "ip=192.168.3.10${count.index + 1}/24,gw=192.168.3.1"
  ciuser     = "ubuntu"
  nameserver = "192.168.200.11"
  sshkeys    = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDN5ZFNLiQBWrCk6y6TP/8UEqhdY77cKrv5smsCTU9ggDiYYpv0bIVcoSmWFZnahIi/TsXPAf80HMulJvPt0l19gdaStax4zOd4D682yqiR6U2pasBS4yTHiXye1YUd1RkoIW+YVc3zdXc7Veq5k4KBteXkx6Ntzzb9L+aMWCiYu71UIs/IwpBWewjWe0MJiWnYDn0xrAPAjQubmq03u0hEiDHZmz0gu2OgKKC/5N3jURyDRRfrVPF4goufVJXJYsV6N2ROE3i17dt5oJALTgX9cpL/zp9JBjaqidZNDdP/6n9D4YrD+8qBHFsLlJbyIPV+5zGBViGVWEuUlZTtSsIx root@pve
    EOF
}

resource "proxmox_vm_qemu" "cloudinit-k3s-worker" {
  # Node name has to be the same name as within the cluster
  # this might not include the FQDN
  target_node = "pve"
  desc        = "Cloudinit Ubuntu"
  count       = 2
  onboot      = false

  # The template name to clone this vm from
  clone = "ubuntu-cloud"

  # Activate QEMU agent for this VM
  agent = 0

  os_type = "cloud-init"
  cores   = 2
  sockets = 2
  numa    = true
  vcpus   = 0
  cpu     = "host"
  memory  = 4096
  name    = "k3s-worker-0${count.index + 1}"

  cloudinit_cdrom_storage = "local-lvm"
  scsihw                  = "virtio-scsi-single"
  bootdisk                = "scsi0"

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = 12
        }
      }
    }
  }

  # Setup the ip address using cloud-init.
  # Keep in mind to use the CIDR notation for the ip.
  ipconfig0 = "ip=192.168.3.11${count.index + 1}/24,gw=192.168.3.1"
  ciuser    = "ubuntu"
  sshkeys   = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDN5ZFNLiQBWrCk6y6TP/8UEqhdY77cKrv5smsCTU9ggDiYYpv0bIVcoSmWFZnahIi/TsXPAf80HMulJvPt0l19gdaStax4zOd4D682yqiR6U2pasBS4yTHiXye1YUd1RkoIW+YVc3zdXc7Veq5k4KBteXkx6Ntzzb9L+aMWCiYu71UIs/IwpBWewjWe0MJiWnYDn0xrAPAjQubmq03u0hEiDHZmz0gu2OgKKC/5N3jURyDRRfrVPF4goufVJXJYsV6N2ROE3i17dt5oJALTgX9cpL/zp9JBjaqidZNDdP/6n9D4YrD+8qBHFsLlJbyIPV+5zGBViGVWEuUlZTtSsIx root@pve
    EOF
}