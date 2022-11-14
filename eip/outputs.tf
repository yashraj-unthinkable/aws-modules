output "eip_id" {
  value       = aws_eip.this[*].id
  description = "ID of Elastic IP"
}

output "public_ip" {
  value       = aws_eip.this[*].public_ip
  description = "Public IP of Elastic IP"
}

output "public_dns" {
  value       = aws_eip.this[*].public_dns
  description = "Public DNS of Elastic IP"
}
