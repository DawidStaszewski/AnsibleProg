resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/ansible-cp-cloud-server/inventory/hosts.ini"
  content = templatefile("${path.module}/inventory.tpl", {
    vm_ips = {
      for key, vm in var.vms :
      key => split("/", local.ip_pool[index(keys(var.vms), key)])[0]
    }
  })
}
