# EC2 bastion Instance
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  # Set the variables
  name                   = "bastion"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.bastion_sg.security_group_id]
}