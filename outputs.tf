output "info" {
  value = merge([module.name.*.hostname], 
                [module.name.*.dns_suffix], 
                [module.ipam.*.ip_address], 
                [module.ipam.*.netmask],
                [module.ipam.*.gateway],
                [module.ipam.*.network],
                [module.ipam.*.subnet],
                [module.ipam.*.primary_dns],
                [module.ipam.*.secondary_dns],
                [module.name.*.fqdn],
                [module.ad_computer.*.ad_ou]
          )
}