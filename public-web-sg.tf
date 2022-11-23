# App Instance Security Group
module "web_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "publicweb-sg"
  description = "Allow incoming traffic on port 80 from Self IP and allow all egress"
  vpc_id      = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

}