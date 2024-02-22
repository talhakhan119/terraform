variable "domain" {}
variable "google_site_verification" {
  default  = ""
}
variable "brave_site_verification" {
  default  = ""
}
variable "bing_site_verification" {
  default  = ""
}
variable "dkim" {
  default  = ""
}

variable "spf" {
  default  = ""
}

variable "dmarc" {
  default  = ""
}

variable "gsuite" {
  default  = "1"
}

variable "ip_v4" {}
variable "ip_v6" {
  default  = ""
}