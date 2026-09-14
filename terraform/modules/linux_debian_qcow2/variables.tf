variable "vm_id" {
  type = number
}

variable "vm_hostname" {
  type = string
}

variable "vm_ip" {
  type = string
}

variable "target_node" {
  type = string
}

variable "vm_gateway" {
  type = string
}

variable "clone_from" {
  type    = number
  default = 9999
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2048
}

variable "ssh_public_key_path" {
  type    = string
  default = "/root/.ssh/id_ed25519.pub"
}
