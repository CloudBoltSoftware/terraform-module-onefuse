variable "name_policy" {
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

variable "template_properties" {
  type = map
  default = {}
}
