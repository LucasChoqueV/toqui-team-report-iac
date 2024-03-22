module "trj_instances_kp" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "2.0.2"

  key_name_prefix    = "${local.name}-instances-kp-"
  create_private_key = true

  tags = merge(
    local.common_tags,
    {
      Resource = local.resources.key_pair
    }
  )
}