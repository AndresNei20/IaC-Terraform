# Security Group = firewall for the EC2 instance.
# It controls what traffic can enter and leave the VM.
resource "aws_security_group" "web_sg" {
  name        = "${var.project_name}-web-sg"
  description = "Allow HTTP access to web server"
  vpc_id      = var.vpc_id

  # Allows HTTP traffic from anywhere on the internet.
  # Port 80 is used by normal web pages.
  ingress {
    description = "Allow HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_http_cidr]
  }

  # Allows the instance to send traffic out.
  # This is needed so the VM can install packages like nginx.
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-web-sg"
  })
}

# EC2 instance = the virtual machine.
# This VM will run nginx and serve the HTML page.
resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  # user_data runs when the instance boots for the first time.
  # We use it to install nginx and create the index.html page automatically.
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              echo "Hi, I am ${var.owner_name} and this is my IaC" > /var/www/html/index.html
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = merge(var.tags, {
    Name = "${var.project_name}-web-server"
  })
}