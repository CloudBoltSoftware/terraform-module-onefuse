module "name" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//naming"
    count = "${var.name_policy == "" ? 0 : var.instance_count}"
    policy = var.name_policy
    template_properties = var.template_properties
}

module "ad_computer" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ad"
    count = "${var.ad_policy == "" ? 0 : var.instance_count}"
    policy = var.ad_policy
    hostname = "${module.name[count.index].hostname == "" ? var.hostname : module.name[count.index].hostname}"
    template_properties = var.template_properties
}

module "ipam" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ipam"
    count = "${var.ipam_policy == "" ? 0 : var.instance_count}"
    policy = var.ipam_policy
    hostname = "${module.name[count.index].hostname == "" ? var.hostname : module.name[count.index].hostname}"
    template_properties = var.template_properties
}

module "dns" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//dns"
    count = "${var.dns_policy == "" ? 0 : var.instance_count}"
    policy = var.dns_policy
    ip_address = "${module.ipam[count.index].ip_address == "" ? var.hostname : module.ipam[count.index].ip_address}"
    dns_zones = module.name[count.index].dns_suffix
    hostname = "${module.name[count.index].hostname == "" ? var.hostname : module.name[count.index].hostname}"
    template_properties = var.template_properties
}
