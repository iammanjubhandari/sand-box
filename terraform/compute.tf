
resource "aws_instance" "iammanjubhandari-ec2instance" {
  ami               = "ami-0df609f69029c9bdb"
  instance_type     = "t2.micro"
  availability_zone = "ap-southeast-2a" # Sydney
  associate_public_ip_address = true
  vpc_security_group_ids      = aws_security_group.iammanjubhandari-sandbox-sg.id
  key_name                    = aws_key_pair.iammanjubhandari-key.sandbox
    user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get upgrade -y
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>🚀 AWS Infra created using Terraform in ap-southeast-2 (Sydney) Region</h1>" > /var/www/html/index.nginx-debian.html
              EOF
  tags = {
    Name = "iammanjubhandari-ec2instance"
    Env  = "sandbox"
  }
}


