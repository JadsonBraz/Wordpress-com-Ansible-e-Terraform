# Wordpress com Ansible e Terraform

O presente projeto tem como objetivo realizar a instalação e a pré-configuração do Wordpress em uma instância EC2 utilizando Terraform em conjunto com o Ansible.

## Começando...

Estas instruções irão te ajudar a criar uma cópia do projeto e realizar a instalação do mesmo em uma instância EC2.

### Pré-requisitos

Primeiramente precisamos ter instalados no ambiente local o [Terraform CLI](https://www.terraform.io/downloads) e o [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html).

Para ver se o Terraform está instalado, basta executar o comando:

		terraform version

**O projeto utiliza o EC2 da AWS. Certifique-se de estar com as credenciais da AWS devidamente configuradas na sua máquina local.**

Para ver se o Ansible está instalado, basta executar o comando:

		ansible --version

Após tudo instalado, iremos criar uma chave SSH, para que possamos acessar a instância EC2.

		ssh-keygen -f terraform-aws -t rsa

Entre no Console do AWS e adicione a chave pública que foi gerada. A chave privada deverá ser guardada em um local seguro.

### Instalando

Primeiro devemos subir as instâncias EC2 no AWS. Para isso iremos abrir um terminal dentro da pasta **terraform** e executar o comando:

		terraform apply

Confirme as mudanças digitando *yes* e pressione *enter*.

No final da execução do comando, devemos ver uma saída com os valores dos IPs públicos e privados das duas instâncias EC2 que foram criadas.

~~~sh
Outputs:		

	ip_mysql = [
		"3.86.190.24",
		"172.31.89.103",
	]
	ip_wordpress = [
		"3.95.200.154",
		"172.31.88.213",
	]
~~~

Agora iremos configurar o arquivo **hosts"** do Ansible. O projeto tem um arquivo **hosts.example**. Faça uma cópia deste arquivo e renomeie para **hosts**.

Dentro deste arquivo iremos adicionar os IPs **públicos** dos servidores EC2 que iremos utilizar.

~~~
[wordpress]
3.95.200.154 ansible_user=ubuntu ansible_ssh_private_key_file="local/of/your/key"

[database]
3.86.190.24 ansible_user=ubuntu ansible_ssh_private_key_file="local/of/your/key"
~~~

* Não esqueça de substituir o local onde está a chave SSH privada.

Após configurar o arquivo **hosts**, iremos instalar e configurar o servidor apache, o banco de dados MySQL e o Wordpress, digitando o seguinte comando:

		ansible-playbook -i hosts provisioning.yml

Confirme a execução do comando digitando *yes* e pressione *enter*, caso seja perguntado.

Depois de alguns minutos tudo estará instalado. No final deverá aparecer uma mensagem no terminal semelhante a esta:
~~~
PLAY RECAP ********************************************************************************************************
3.86.190.24                : ok=7    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
3.95.200.154               : ok=8    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
~~~

Para testar a aplicação digite o IP público da instância que contém o Wordpress:

		http://3.95.200.154

Caso veja a tela inicial do Wordpress, o projeto está funcionando corretamente.


## Construído com:

* [Terraform](https://maven.apache.org/)
* [Ansible](http://www.dropwizard.io/1.0.2/docs/) 


## Licença

Este projeto está licenciado sob a Licença MIT

