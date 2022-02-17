variable "ami_ubuntu_18" {
    type = map

    default = {
        us-east-1 = "ami-0e472ba40eb589f49"
        # us-east-2="ami-kkjlejr1o3j3491io"
    }
}

variable "cdirs_acesso_ssh" {
    type = list

    default = ["0.0.0.0/0"]
}

variable "key_name" {
    default = "terraform-aws"
}