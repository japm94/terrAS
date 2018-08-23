output "vpn-address" {
  value = "${aws_instance.vpn.public_ip}"
}

output "vpn-connection" {
  value = "ssh ${var.ec2-user}@${aws_instance.vpn.public_ip}"
}