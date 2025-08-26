resource "aws_vpc" "iammanjubhandari-vpc-sandbox" {
  cidr_block           = "10.50.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "iammanjubhandari-vpc-sandbox"
    Env  = "dev"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.iammanjubhandari-vpc-sandbox.id
  cidr_block              = "10.50.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "iammanjubhandari-public-subnet-sandbox-us-east-1"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.iammanjubhandari-vpc-sandbox
  cidr_block        = "10.50.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "iammanjubhandari-sandbox-igw" {
  vpc_id = aws_vpc.iammanjubhandari-vpc-sandbox.id
}

resource "aws_route_table" "iammanjubhandari-sandbox-public-route-table" {
  vpc_id = aws_vpc.iammanjubhandari-vpc-sandbox.id
}

resource "aws_route" "iammanjubhandari-sandbox-public-route" {
  route_table_id         = aws_route_table.iammanjubhandari-sandbox-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.iammanjubhandari-sandbox-igw.id
}

resource "aws_route_table_association" "iammanjubhandari-sandbox-public-route-table-associate" {
  route_table_id = aws_route_table.iammanjubhandari-sandbox-public-route-table.id
  subnet_id      = aws_subnet.public_subnet.id
}
