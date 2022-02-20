# Definicao dos provedores
terraform {
  required_providers {
    aws = {
      source  = "aws"
      version = "4.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Definir as instancias
# Aplicacao wordpress
resource "aws_instance" "wp" {
  ami           = var.ami_ubuntu_18["us-east-1"]
  instance_type = "t2.micro"
  key_name      = var.key_name # chave de acesso para ssh
  tags = {
    Name = "wp-srve" # ["dev-srve-${count.index}"] -> dev-srve-1, dev-srve-2, ...
  }

  private_ip = "172.31.88.213"

  security_groups = ["default"]

  vpc_security_group_ids = [
    "${aws_security_group.acesso-ssh.id}",
    "${aws_security_group.acesso-http.id}"
  ]
}

# Mysql
resource "aws_instance" "mysql" {
  ami           = var.ami_ubuntu_18["us-east-1"]
  instance_type = "t2.micro"
  key_name      = var.key_name # chave de acesso para ssh
  tags = {
    Name = "mysql-srve"
  }

  private_ip = "172.31.89.103"

  security_groups = ["default"]

  vpc_security_group_ids = [
    "${aws_security_group.acesso-ssh.id}",
  ]
}