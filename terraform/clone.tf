module "linux_vm" {
  source   = "./modules/linux_debian_qcow2"
  for_each = var.linux_vms

  vm_id       = each.value.vm_id
  vm_hostname = each.value.vm_hostname
  vm_ip       = "${local.linux_ip_pool[each.key]}/24"
  target_node = var.target_node
  vm_gateway  = var.vm_gateway
}

module "windows_vm" {
  source   = "./modules/windows_server2022_raw"
  for_each = var.windows_vms

  vm_id       = each.value.vm_id
  vm_hostname = each.value.vm_hostname
  vm_ip       = "${local.windows_ip_pool[each.key]}/24"
  target_node = var.target_node
  vm_gateway  = var.vm_gateway
}

output "linux_clone_ip" {
  value = { for k, m in module.linux_vm : k => m.ip_address }
}

output "windows_clone_ip" {
  value = { for k, m in module.windows_vm : k => m.ip_address }
}
