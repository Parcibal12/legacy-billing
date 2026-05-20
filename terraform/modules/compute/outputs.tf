output "public_ip" {
  description = "IP publica de la instancia EC2"
  value       = aws_instance.app_server.public_ip
}