resource "aws_security_group" "sg_app" {
  name        = "legacy-billing-sg"
  description = "Permitir trafico en el puerto de la aplicacion y SSH"

  ingress {
    description = "Acceso a la aplicacion Node.js"
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # <-- Volvemos a abrirlo para que no haya bloqueos de IP
  }

  ingress {
    description = "Acceso SSH para administracion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["190.104.20.154/32"] # <-- Dejamos la seguridad estricta para el SSH
  }

  egress {
    description = "Trafico de salida sin restricciones"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}