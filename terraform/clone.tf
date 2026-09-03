resource "proxmox_virtual_environment_vm" "homelab_clone" {
  name      = var.vm_hostname
  node_name = var.target_node
  vm_id	    = var.vm_id

  clone {
    vm_id = 9000
    full  = true
  }

  vga{
    type = "std"
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  agent {
    enabled = true
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
    user_account {
      username = "admin"
      keys = [file("/root/.ssh/id_ed25519.pub")]
    }
  }
}

output "clone_ip" {
  value = proxmox_virtual_environment_vm.homelab_clone.ipv4_addresses
}

