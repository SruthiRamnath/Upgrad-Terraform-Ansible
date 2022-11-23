# EC2 Jenkins Instance
module "ec2_jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  # Set the variables
  name                   = "Jenkins"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id = module.vpc.private_subnets[0]
  vpc_security_group_ids = [module.private_sg.security_group_id]
}