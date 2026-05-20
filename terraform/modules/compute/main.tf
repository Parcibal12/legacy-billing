resource "aws_instance" "app_server" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = null # AWS Academy despliega en la subred por defecto si se omite, o se asocia via SG.
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile
  key_name             = var.key_name
  user_data            = var.user_data

  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "legacy-billing-server"
  }
}