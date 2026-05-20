variable "ami_id" {
  description = "ID de la AMI de Amazon Linux 2023"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "security_group_id" {
  description = "ID del Security Group del modulo network"
  type        = string
}

variable "iam_instance_profile" {
  description = "Nombre del perfil de instancia IAM"
  type        = string
}

variable "user_data" {
  description = "Script de arranque para el servidor"
  type        = string
}

variable "key_name" {
  description = "Nombre de la llave SSH"
  type        = string
}