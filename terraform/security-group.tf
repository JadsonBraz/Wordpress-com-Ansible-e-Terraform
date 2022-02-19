# security group
# acesso ssh
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Acesso SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.cdirs_acesso_ssh}"
  }

  tags = {
    Name = "acesso-ssh"
  }
}

# acesso a porta 80
resource "aws_security_group" "acesso-http" {
	name = "acesso-http"
	description = "Acesso aa maquina pela porta 80"

	ingress {
		from_port	= 80
		to_port		= 80
		protocol	= "tcp"
		cidr_blocks = "${var.cdirs_acesso_http}"
	}

	tags = {
		Name = "acesso-http"
	}
}

# acesso externo a internet
resource "aws_security_group" "acesso-internet" {
	name = "acesso-internet"
	description = "Acesso da maquina aa internet"

	egress {
  	from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "${var.cdirs_acesso_internet}"
  }
	
	tags = {
		Name = "acesso-internet"
	}
}