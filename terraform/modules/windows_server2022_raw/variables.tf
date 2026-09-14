variable "vm_id" {}
variable "vm_hostname" {}
variable "vm_ip" {}
variable "target_node" {}
variable "vm_gateway" {}
variable "clone_from" {
  type    = number
  default = 9998 # ID szablonu Windows
}
variable "cores" {
  type    = number
  default = 2
}
variable "memory" {
  type    = number
  default = 4096
}
variable "admin_password" {
  sensitive = true
}
