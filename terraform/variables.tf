variable "network_base" {
  type = string
  default = "192.168.20.0/24"
}

variable "range_start" {
  type = number
  default = 21
}

variable "range_end" {
  type = number
  default = 99
}

variable "linux_vms" {
  type = map(object({
    vm_id = number
    vm_hostname = string
  }))
}

variable "windows_vms" {
  type = map(object({
    vm_id       = number
    vm_hostname = string
  }))
  default = {}
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
