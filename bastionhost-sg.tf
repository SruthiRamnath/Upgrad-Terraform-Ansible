# Bastion Host Security Group
module "bastion_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "bastion-sg"
  description = "Bastion host SG - Allow self ip to ssh to bastion instance and allow all egress."
  vpc_id      = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
  }