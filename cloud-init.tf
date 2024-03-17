resource "proxmox_vm_qemu" "cloudinit-k3s-master" {
  # Node name has to be the same name as within the cluster
  # this might not include the FQDN
  target_node = var.target_node_pve
  desc        = "Cloudinit Ubuntu"
  count       = 2
  onboot      = false

  # The template name to clone this vm from
  clone = var.clone

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

  cloudinit_cdrom_storage = var.cloudinit_cdrom_storage
  scsihw                  = "virtio-scsi-single"
  bootdisk                = "scsi0"

  disks {
    scsi {
      scsi0 {
        disk {
          storage = var.storage
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
  sshkeys    = var.sshkey
}

resource "proxmox_vm_qemu" "cloudinit-k3s-worker" {
  # Node name has to be the same name as within the cluster
  # this might not include the FQDN
  target_node = var.target_node
  desc        = "Cloudinit Ubuntu"
  count       = 2
  onboot      = false

  # The template name to clone this vm from
  clone = var.clone

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

  cloudinit_cdrom_storage = var.cloudinit_cdrom_storage
  scsihw                  = "virtio-scsi-single"
  bootdisk                = "scsi0"

  disks {
    scsi {
      scsi0 {
        disk {
          storage = var.storage
          size    = 12
        }
      }
    }
  }

  # Setup the ip address using cloud-init.
  # Keep in mind to use the CIDR notation for the ip.
  ipconfig0 = "ip=192.168.3.11${count.index + 1}/24,gw=192.168.3.1"
  ciuser    = "ubuntu"
  sshkeys   = var.sshkey
}