variable "vm_id" {}
variable "vm_hostname" {}
variable "vm_ip" {}
variable "target_node" {}
variable "vm_gateway" {}
variable "clone_from" {
  type    = number
  default = 9000
}
variable "cores" {
  type    = number
  default = 2
}
variable "memory" {
  type    = number
  default = 4096
}

variable "username"{
  type=string
  default = "Administrator"
}

variable "admin_password" {
  type = string
  sensitive = true
  default = "Admin123!Strong"
}
