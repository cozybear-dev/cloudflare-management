module "domain_redirect" {
  for_each = toset([
    "shadowbrokers.hk"
  ])

  source     = "./modules/domain_redirect"
  account_id = "71ccf1d8c0f95f2629768483d5b41150"
  domain     = each.value
}