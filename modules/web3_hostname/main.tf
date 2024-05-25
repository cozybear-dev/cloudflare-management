resource "cloudflare_zone" "domain" {
  account_id = var.account_id
  zone       = var.domain
}

resource "cloudflare_web3_hostname" "web3_hostname" {
  name    = "${var.subdomain}.${var.domain}"
  target  = var.web3_gateway_type
  zone_id = cloudflare_zone.domain.id
  dnslink = var.dnslink
}