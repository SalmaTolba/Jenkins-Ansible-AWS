module "network_module" {
  source           = "./network"
  region_n         = var.region
  cidr_vpc_n       = var.cidr_vpc
  first_public_n   = var.first_public
  second_public_n  = var.second_public
  first_private_n  = var.first_private
  second_private_n = var.second_private
}