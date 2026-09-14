locals {
  ip_pool = [
    for n in range (var.range_start, var.range_end +1) :
    cidrhost(var.network_base, n)
  ]

  linux_ip_pool = {
    for id, key in keys(var.linux_vms) :
    key => local.ip_pool[id]
  }

  windows_ip_pool = {
    for id, key in keys(var.windows_vms) :
    key => local.ip_pool[id + length(var.linux_vms)]
  }
}
