resource "aws_security_group" "postgresql" {
  vpc_id = module.vpc.vpc_id

  tags = merge(
    {
      Name        = "sgDatabaseServer",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}