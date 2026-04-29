# Public IP of the EC2 instance.
output "public_ip" {
  value = aws_instance.web.public_ip
}

# Full URL for testing the website.
output "website_url" {
  value = "http://${aws_instance.web.public_ip}"
}