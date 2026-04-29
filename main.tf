resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu (we can change if needed)
  instance_type = "t2.micro"

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