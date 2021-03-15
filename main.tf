module "name" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//naming?ref=v1.2-beta.1"
    count = "${var.use_ad == "" ? 0 : var.instance_count}"
    policy = var.name_policy
    template_properties = var.template_properties
}

module "ad_computer" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ad?ref=v1.2-beta.1"
    count = "${var.ad_policy == "" ? 0 : var.instance_count}"
    policy = var.ad_policy
    hostname = module.name.hostname
    template_properties = var.template_properties
}

module "ipam" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ipam?ref=v1.2-beta.1"
    count = "${var.ipam_policy == "" ? 0 : var.instance_count}"
    policy = var.ipam_policy
    hostname = module.name.hostname
    template_properties = var.template_properties
}

module "dns" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//dns?ref=v1.2-beta.1"
    count = "${var.dns_policy == "" ? 0 : var.instance_count}"
    policy = var.dns_policy
    ip_address = module.ipam.ip_address
    dns_zones = module.name.dns_suffix
    hostname = module.name.hostname
    template_properties = var.template_properties
}
