data "aws_vpc" "default" {
  default = true
}

data "aws_ami" "ami_ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240301"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "template_file" "user_data" {
  template = file("scripts/instance_data.sh")

  vars = {
    docker_version = "26.0"
  }
}