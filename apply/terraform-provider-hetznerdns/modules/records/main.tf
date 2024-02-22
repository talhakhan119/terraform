resource "hetznerdns_zone" "zone1" {
    name = var.domain
    ttl  = 60
}

resource "hetznerdns_record" "root" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "@"
    value   = var.ip_v4
    type    = "A"
    ttl     = 60
}

resource "hetznerdns_record" "root6" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "@"
    value   = var.ip_v6
    type    = "AAAA"
    ttl     = 60

    count   = var.ip_v6 != "" ? 1 : 0
}

resource "hetznerdns_record" "www" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "www"
    value   = "${var.domain}."
    type    = "CNAME"
    ttl     = 3600
}

resource "hetznerdns_record" "all" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "*"
    value   = "${var.domain}."
    type    = "CNAME"
    ttl     = 3600
}

resource "hetznerdns_record" "mx" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "@"
    value   = "1 aspmx.l.google.com."
    type    = "MX"
    ttl     = 3600
}

resource "hetznerdns_record" "mxalt1" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "@"
    value   = "5 alt1.aspmx.l.google.com."
    type    = "MX"
    ttl     = 3600
}

resource "hetznerdns_record" "mxalt2" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "@"
    value   = "5 alt2.aspmx.l.google.com."
    type    = "MX"
    ttl     = 3600
}

resource "hetznerdns_record" "mxalt3" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "@"
    value   = "10 alt3.aspmx.l.google.com."
    type    = "MX"
    ttl     = 3600
}

resource "hetznerdns_record" "mxalt4" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "@"
    value   = "10 alt4.aspmx.l.google.com."
    type    = "MX"
    ttl     = 3600
}

resource "hetznerdns_record" "txtgoogle" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "@"
    value   = var.google_site_verification
    type    = "TXT"
    ttl     = 3600
    
    count   = var.google_site_verification != "" ? 1 : 0
}

resource "hetznerdns_record" "txtdkim" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "google._domainkey"
    value   = var.dkim
    type    = "TXT"
    ttl     = 3600
    
    count   = var.dkim != "" ? 1 : 0
}

resource "hetznerdns_record" "txtspf" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "@"
    value   = var.spf
    type    = "TXT"
    ttl     = 3600
    
    count   = var.spf != "" ? 1 : 0
}

resource "hetznerdns_record" "txtdmarc" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "_dmarc"
    value   = replace(var.dmarc, "DOMAIN", hetznerdns_zone.zone1.name)
    type    = "TXT"
    ttl     = 3600
    
    count   = var.dmarc != "" ? 1 : 0
}

resource "hetznerdns_record" "txtbrave" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "@"
    value   = var.brave_site_verification
    type    = "TXT"
    ttl     = 3600
    
    count   = var.brave_site_verification != "" ? 1 : 0
}

resource "hetznerdns_record" "gsuite_mail" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "mail"
    value   = "ghs.google.com."
    type    = "CNAME"
    ttl     = 3600
    
    count   = var.gsuite != "" ? 1 : 0
}

resource "hetznerdns_record" "gsuite_calendar" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "calendar"
    value   = "ghs.google.com."
    type    = "CNAME"
    ttl     = 3600
    
    count   = var.gsuite != "" ? 1 : 0
}

resource "hetznerdns_record" "gsuite_docs" {
    zone_id = hetznerdns_zone.zone1.id
    name    = "docs"
    value   = "ghs.google.com."
    type    = "CNAME"
    ttl     = 3600
    
    count   = var.gsuite != "" ? 1 : 0
}