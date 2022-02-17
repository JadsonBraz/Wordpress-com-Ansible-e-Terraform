output "ip_dev" {
	value = "${aws_instance.dev.public_ip}"
}