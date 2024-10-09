# VPC Configuration 

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  # Existing VPC ID
  name = "my-vpc" # change it to existing
  cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  tags = {
    terraform = "true"

  }
}

resource "aws_internet_gateway" "alanp_internet_gateway" {
  vpc_id = "vpc-093e61122698b1185"

  tags = {
    Name = "ap-vpc-igw"
  }
}