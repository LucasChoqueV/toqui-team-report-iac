module "trw_instances_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "${local.name}-instances-sg"
  description = "Security Group for frontend and backend instances"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = local.all_ips
  ingress_rules       = [local.ssh_protocol, local.http_protocol, local.https_protocol]

  egress_rules = local.all_all

  tags = merge(
    local.common_tags,
    {
      Resource = local.resources.security_group
    }
  )
}
