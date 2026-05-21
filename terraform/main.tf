# Buscar de forma dinamica la AMI mas reciente de Amazon Linux 2023
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# Llamada al Modulo de Red
module "network" {
  source   = "./modules/network"
  app_port = var.app_port
}

# Llamada al Modulo de Computo
module "compute" {
  source               = "./modules/compute"
  ami_id               = data.aws_ami.amazon_linux_2023.id
  instance_type        = var.instance_type
  security_group_id    = module.network.security_group_id
  iam_instance_profile = var.iam_instance_profile
  key_name             = var.key_name

  # Script de arranque optimizado para Amazon Linux 2023 (usa dnf/yum)
  user_data = <<-EOF
              #!/bin/bash
              # Actualizar el sistema e instalar Node.js 20 junto con Git
              sudo dnf update -y
              sudo dnf install -y nodejs git

              # Preparar el directorio de despliegue
              mkdir -p /home/ec2-user/app
              cd /home/ec2-user/app

              # Clonar tu repositorio de la aplicacion
              git clone https://github.com/Parcibal12/legacy-billing.git .

              # Instalar las dependencias de produccion
              npm install --production

              # Iniciar la aplicacion levantando el servicio en segundo plano
              nohup npm start > app.log 2>&1 &

              # COMENTARIO PARA FORZAR RECREACION DEL SERVIDOR V2
              EOF
}