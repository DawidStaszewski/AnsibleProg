locals {
  ip_pool = [
    for n in range (var.range_start, var.range_end +1) :
    cidrhost(var.network_base, n)
  ]
}
