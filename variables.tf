variable "name_policy" {
  type = string
  default = ""
}

variable "hostname" {
  type = string
  default = ""
}

variable "ip_address" {
  type = string
  default = ""
}

variable "dns_suffix" {
  type = string
  default = ""
}
variable "ad_policy" {
  type = string
  default = ""
}

variable "ipam_policy" {
  type = string
  default = ""
}

variable "dns_policy" {
  type = string
  default = ""
}

variable "instance_count" {
  type = string
  default = "1"
}

variable "template_properties" {
  type = map
}
