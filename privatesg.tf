# Private Instances Security Group
module "private_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "private-sg"
  description = "Allow all ingress traffic from within VPC and allow all egress"
  vpc_id      = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

}