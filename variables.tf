variable "name_policy" {
  type = string

}

variable "ad_policy" {
  type = string
  default = ""
}

variable "ipam_policy" {
  type = string

}

variable "dns_policy" {
  type = string

}

variable "template_properties" {
  type = map
}
