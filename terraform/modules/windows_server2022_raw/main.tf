terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

resource "proxmox_virtual_environment_vm" "this" {
  name      = var.vm_hostname
  node_name = var.target_node
  vm_id     = var.vm_id

  clone {
    vm_id = var.clone_from
    full  = true
  }

  vga {
    type = "std"
  }

  cpu {
    cores = var.cores
  }

  agent {
    enabled = true
    timeout = "5m"
  }

  memory {
    dedicated = var.memory
  }

  operating_system {
    type = "win11"
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.vm_ip
        gateway = var.vm_gateway
      }
    }
    user_account {
      username = var.username
      password = var.admin_password
    }
  }

  lifecycle {
    prevent_destroy = false
  }
}
