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
resource "aws_instance" "dev" {
  # count         = 2              # criar 2 instancias
  ami           = var.ami_ubuntu_18["us-east-1"]
  instance_type = "t2.micro"
  key_name      = var.key_name # chave de acesso para ssh
  tags = {
    Name = "dev-srve-1" # ["dev-srve-${count.index}"] -> dev-srve-1, dev-srve-2, ...
  }
  vpc_security_group_ids = [
    "${aws_security_group.acesso-ssh.id}",
    "${aws_security_group.acesso-http.id}",
    "${aws_security_group.acesso-internet.id}"
  ]
}

