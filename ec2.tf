resource "aws_instance" "public_instance" {
  for_each               = toset(var.instances)
  ami                    = var.ec2_ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  tags = {
    "Name" : "${each.value}-${local.sufix}"
  }
}

resource "aws_instance" "monitoring_instance" {
  count                  = var.monitoring ? 1 : 0
  ami                    = var.ec2_ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  tags = {
    "Name" : "monitoring-instance-${local.sufix}"
  }
}

