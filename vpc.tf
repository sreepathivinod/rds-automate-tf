module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_priv_subnet
  public_subnets  = var.vpc_pub_subnet

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = merge(
    {
      Name        = var.vpc_name,
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}