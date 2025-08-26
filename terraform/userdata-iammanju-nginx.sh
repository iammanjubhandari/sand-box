#!/bin/bash
# Update system
apt-get update -y
apt-get install -y nginx

# Enable and start nginx
systemctl enable nginx
systemctl start nginx

# Custom landing page
cat <<EOF > /var/www/html/index.nginx-debian.html
<!DOCTYPE html>
<html>
<head>
    <title>Terraform AWS Sand-box</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }
        h1 { color: #2E86C1; }
        h2 { color: #117A65; }
        p  { color: #555; }
        footer { margin-top: 40px; font-size: 12px; color: gray; }
    </style>
</head>
<body>
    <h1> Welcome to my AWS Sandbox - iammanjubhandari</h1>
    <h2>AWS Infra created using <b>Terraform</b> in <b>ap-southeast-2 (Sydney) Region</b></h2>
    <p>This EC2 instance was provisioned automatically with Terraform and bootstrapped using <code>user_data</code>.</p>
    <p>Web server: <b>Nginx</b> running on Ubuntu 22.04</p>
    <footer>Managed by iammanjubhandari | DevOps Sandbox</footer>
</body>
</html>
EOF
