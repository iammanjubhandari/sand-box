
resource "aws_instance" "iammanjubhandari-ec2instance" {
  ami               = var.ec2_ami_id
  instance_type     = "t2.micro"
  availability_zone = var.aws_region
  associate_public_ip_address = true
  vpc_security_group_ids      = aws_security_group.iammanjubhandari-sandbox-sg.id
  key_name                    = aws_key_pair.iammanjubhandari-key.sandbox

  # Load external user_data script
  user_data = file("${path.module}/userdata-iamamanju-nginx.sh")

  tags = {
    Name = "iammanjubhandari-ec2instance"
    Env  = "sandbox"
  }
}


