# EC2 APP Instance
module "ec2_app" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  # Set the variables
  name                   = "app"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id = module.vpc.private_subnets[1]
  vpc_security_group_ids = [module.private_sg.security_group_id]
}