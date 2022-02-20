output "ip_dev" {
  value = [
    "${aws_instance.dev[0].public_ip}",
    "${aws_instance.dev[1].public_ip}"
  ]
}
