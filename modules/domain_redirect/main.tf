resource "cloudflare_zone" "domain" {
  account_id = var.account_id
  zone       = var.domain
}

resource "cloudflare_record" "a" {
  for_each = toset([
    "@",
    "www"
  ])
  zone_id = cloudflare_zone.domain.id
  name    = each.value
  value   = "192.0.2.1"
  type    = "A"
  proxied = true
  ttl     = 1
}

resource "cloudflare_ruleset" "single_redirect" {
  zone_id     = cloudflare_zone.domain.id
  name        = "redirects"
  description = "Redirect to EU"
  kind        = "zone"
  phase       = "http_request_dynamic_redirect"

  rules {
    action = "redirect"
    action_parameters {
      from_value {
        status_code = 301
        target_url {
          value = var.redirect_target
        }
        preserve_query_string = true
      }
    }
    expression  = "(http.host contains \"${var.domain}\")"
    description = "Redirect to EU"
    enabled     = true
  }
}
