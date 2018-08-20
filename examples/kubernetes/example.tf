resource "vultr_dns_domain" "example" {
  domain = "example.com"
  ip     = "0.0.0.0"
}

module "typhoon" {
  source = "git::https://github.com/squat/typhoon-vultr?ref=4508c36ca85612b3a6d9b55e1f91bea900661671"

  cluster_name = "example"

  # Vultr
  region          = "${data.vultr_region.frankfurt.id}"
  dns_zone        = "${vultr_dns_domain.example.domain}"
  controller_type = "${data.vultr_plan.2gb.id}"
  worker_type     = "${data.vultr_plan.2gb.id}"

  # configuration
  ssh_authorized_key = "${file("/path/to/ssh/public/key")}"
  asset_dir          = "assets"

  # optional
  worker_count = 2
}

data "vultr_region" "frankfurt" {
  filter {
    name   = "name"
    values = ["Frankfurt"]
  }
}

data "vultr_plan" "2gb" {
  filter {
    name   = "ram"
    values = ["2048"]
  }
}
