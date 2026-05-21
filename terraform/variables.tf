variable "app_port" {
  type        = number
  default     = 3000
  description = "Puerto asignado para la aplicacion legacy-billing (Grupo A)"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro" # El laboratorio exige iniciar en t2.micro
}

variable "iam_instance_profile" {
  type        = string
  default     = "LabInstanceProfile" # Nombre estandar del perfil en AWS Academy
}

variable "key_name" {
  type        = string
  default     = "vockey" # Llave predefinida de AWS Academy
}