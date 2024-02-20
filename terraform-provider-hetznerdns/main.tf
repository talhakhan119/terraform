# you can save your state in S3 bucket instead of local file

terraform {
    backend "s3" {
    bucket = "hetzner-terraformDNS-shared-state"
    key    = "terraform/terraform-hetzner-dns.tfstate"
    region = "eu-west-1"
  }
}



# you can get another data from you remote state S3 bucket
# e.g. your cluster LB ipv4/ipv6

#data "terraform_remote_state" "cluster" {
#  backend = "s3"

#  config {
#    bucket     = "terraform-shared-state-xyz"
#    region     = "eu-west-1"
#    key        = "cluster/terraform.tfstate"
#  }
#}

locals {
  #ip_v4  = data.terraform_remote_state.cluster.lb_ip_v4
  #ip_v6  = data.terraform_remote_state.cluster.lb_ip_v6

  ip_v4   = "yourIPv4"
  ip_v6   = "yourIPv6"
  spf     = "v=spf1 include:_spf.google.com ~all"

  #do not modify DOMAIN string! it will be replaced with domain name automatically
  dmarc   = "v=DMARC1; p=quarantine; rua=mailto:dmarc-reports@DOMAIN; pct=20; sp=none"
}

#variable "hetznerdns_token" {}

provider "hetznerdns" {
  #export HETZNER_DNS_API_TOKEN=<your api token> or
  #apitoken = var.hetznerdns_token
}

module "example_com_records" {
  source  = "./modules/records"
  
  domain  = "example.com"
  ip_v4   = local.ip_v4
  ip_v6   = local.ip_v6
  dkim    = "v=DKIM1; k=rsa; p=YOURRSAKEY"
  spf     = local.spf
  dmarc   = local.dmarc

  google_site_verification = "google-site-verification=YOURGOOGLEVERIFYKEY"
  bing_site_verification   = "YOURBINVERIFYKEY"
  brave_site_verification  = "brave-ledger-verification=YOURBRAVEVERIFYKEY"
}

# example 2 
# without IPv6
# only google site verification
# without gsuite subdomains - default is ON

module "example2_com_records" {
  source  = "./modules/records"
  
  domain  = "example2.com"
  ip_v4   = local.ip_v4
  gsuite  = ""

  google_site_verification = "google-site-verification=YOURGOOGLEVERIFYKEY"
}
























