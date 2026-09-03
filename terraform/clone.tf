resource "proxmox_virtual_environment_vm" "homelab_clone" {
  for_each = var.vms

  name      = each.value.vm_hostname
  node_name = var.target_node
  vm_id	    = each.value.vm_id

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

  agent {
    enabled = false	
  }


  memory {
    dedicated = 2048
  }

  initialization {
    ip_config {
      ipv4 {
        address = each.value.vm_ip
	gateway = var.vm_gateway
      }
    }
    user_account {
      username = "admin"
      keys = [file("/root/.ssh/id_ed25519.pub")]
    }
  }
}

output "clone_ip" {
  value = {for i, v in proxmox_virtual_environment_vm.homelab_clone : i => v.ipv4_addresses }
}

