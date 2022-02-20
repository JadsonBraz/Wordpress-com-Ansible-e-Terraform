output "ip_wordpress" {
  value = [aws_instance.wp.public_ip, aws_instance.wp.private_ip]
}

output "ip_mysql" {
  value = [aws_instance.mysql.public_ip, aws_instance.mysql.private_ip]
}
