variable "network_base" {
  type = string
  default = "192.168.20.0/24"
}

variable "range_start" {
  type = number
  default = 20
}

variable "range_end" {
  type = number
  default = 65
}

variable "vms" {
  type = map(object({
    vm_id = number
    vm_hostname = string
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
