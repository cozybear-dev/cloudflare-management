locals {
  account_id = "71ccf1d8c0f95f2629768483d5b41150"
}

module "domain_redirect" {
  source     = "./modules/domain_redirect"
  account_id = local.account_id
  domain     = "shadowbrokers.hk"

  redirect_target = "https://shadowbrokers.eu"
}

# this requires a web3 ipfs gateway which can only be setup manually!
module "web3_hostname" {
  source     = "./modules/web3_hostname"
  account_id = local.account_id
  domain     = "cozybear.dev"

  subdomain         = "tornadocash"
  web3_gateway_type = "ipfs"
  dnslink           = "/ipfs/bafybeieffnocaq7t4w4daagvydl32igft5oziyyaebqr6vx6rb3fwh2ab4"
}
