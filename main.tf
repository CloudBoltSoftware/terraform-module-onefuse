module "name" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//naming?ref=v1.2-beta.1"
    policy = var.name_policy
    template_properties = var.template_properties
}

module "ad_computer" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ad?ref=v1.2-beta.1"
    policy = var.ad_policy
    hostname = module.name.hostname
    template_properties = var.template_properties
}

module "ipam" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ipam?ref=v1.2-beta.1"
    policy = var.ipam_policy
    hostname = module.name.hostname
    template_properties = var.template_properties
}

module "dns" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//dns?ref=v1.2-beta.1"
    policy = var.dns_policy
    ip_address = module.ipam.ip_address
    dns_zones = module.name.dns_suffix
    hostname = module.name.hostname
    template_properties = var.template_properties
}
