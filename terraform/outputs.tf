output "instance_public_ip" {
  description = "IP publica de la aplicacion desplegada"
  value       = module.compute.public_ip
}