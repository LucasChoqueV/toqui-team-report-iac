module "trw_web_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.3.1"

  name                        = "${local.name}-web-ec2"
  ami                         = data.aws_ami.ami_ubuntu.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [module.trw_instances_sg.security_group_id]
  monitoring                  = true
  key_name                    = module.trw_instances_kp.key_pair_name
  user_data                   = base64encode(data.template_file.user_data.rendered)
  user_data_replace_on_change = true

  tags = merge(
    local.common_tags,
    {
      Resource = local.resources.instance
    }
  )
}
