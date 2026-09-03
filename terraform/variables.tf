variable "vms" {
  type = map(object({
    vm_id = number
    vm_hostname = string
    vm_ip = string
  }))
}

variable "pve_endpoint" {
  type = string
}

variable "pve_api_token" {
  type      = string
  sensitive = true
}

variable "target_node" {
  type    = string
  default = "pve"
}

variable "vm_gateway" {
  type = string
  default = "192.168.20.1"
}
