output "hostname" {
  value = onefuse_naming.name.name
}

output "dns_suffix" {
  value = onefuse_naming.name.dns_suffix
}

output "fqdn" {
  value = onefuse_naming.name.id
}