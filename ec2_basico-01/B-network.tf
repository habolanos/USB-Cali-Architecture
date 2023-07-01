resource "aws_vpc" "main_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main_vpc"
  }
}

resource "aws_subnet" "main_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "main_subnet"
  }
}

resource "aws_network_interface" "main_ni" {
  subnet_id   = aws_subnet.main_subnet.id
  private_ips = ["10.0.10.100"]

  tags = {
    Name = "main_network_interface"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_eip" "mi_eip" {
  vpc = true
}

resource "aws_nat_gateway" "main_nat_gw" {
  allocation_id = aws_eip.mi_eip.id
  subnet_id     = aws_subnet.main_subnet.id

  tags = {
    Name = "nat_gateway"
  }

  depends_on = [aws_internet_gateway.main_igw]
}