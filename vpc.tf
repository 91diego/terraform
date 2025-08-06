resource "aws_vpc" "vpc_virgina" {
  cidr_block = var.virginia_cidr
  tags = {
    "Name" = "vpc-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virgina.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = var.public_subnet_public_ip
  tags = {
    "Name" = "public-subnet-${local.sufix}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virgina.id

  tags = {
    Name = "igw-vpc-${local.sufix}"
  }
}


resource "aws_route_table" "publi_crt" {
  vpc_id = aws_vpc.vpc_virgina.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "crt-public-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virgina.id
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "subnet-private-${local.sufix}"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.publi_crt.id
}


resource "aws_security_group" "sg_public_instance" {
  name        = "public instance sg"
  description = "Allow SSH inbound traffic and all egress traffic"
  vpc_id      = aws_vpc.vpc_virgina.id

  ingress {
    description = "Allow SSH inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.sg_ingress_cidr]
  }

  tags = {
    Name = "public-instance-${local.sufix}"
  }
}
