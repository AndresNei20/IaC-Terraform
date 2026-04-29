resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              echo "Hi, I am Andres and this is my IaC" > /var/www/html/index.html
              systemctl start nginx
              EOF

  tags = {
    Name = "iac-web-server"
  }
}