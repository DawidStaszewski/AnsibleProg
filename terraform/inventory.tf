resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory/hosts.ini"
  content = templatefile("${path.module}/templates/inventory.tpl", {
    linux_ip = local.linux_ip_pool
    windows_ip = local.windows_ip_pool
  })
}
