// OneFuse Data Source for AD Policy to lookup policy ID
data "onefuse_ad_policy" "policy" {
  count = "${var.ad_policy == "" ? 0 : var.instance_count}"
  name = var.policy
}

// OneFuse Resource for AD Computer Account
resource "onefuse_microsoft_ad_computer_account" "computer" {
    count = "${var.ad_policy == "" ? 0 : var.instance_count}"
    name = var.hostname
    policy_id = data.onefuse_ad_policy.policy.id
    template_properties = var.template_properties
}