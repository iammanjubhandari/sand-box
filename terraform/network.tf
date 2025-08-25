resource "aws_vpc" "iammanjubhandari-vpc-sandbox" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "iammanjubhandari-vpc-sandbox"
    Env  = "dev"
  }
}