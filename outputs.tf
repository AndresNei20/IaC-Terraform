# Public IP returned from the compute module.
output "public_ip" {
  description = "Public IP of the web server"
  value       = module.compute.public_ip
}

# Website URL returned from the compute module.
output "website_url" {
  description = "URL to access the web page"
  value       = module.compute.website_url
}