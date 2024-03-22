locals {
  name           = "${var.project}-${var.environment}"
  ssh_protocol   = "ssh-tcp"
  http_protocol  = "http-80-tcp"
  https_protocol = "https-443-tcp"
  all_ips        = ["0.0.0.0/0"]
  all_all        = ["all-all"]
  common_tags = {
    Terraform   = "true"
    Environment = var.environment
    Project     = var.project
  }
  resources = {
    security_group = "security_group"
    instance       = "instance"
    key_pair       = "key_pair"
  }
}
