resource "aws_key_pair" "auth" {
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "vpn" {
  instance_type = "t2.micro"
  ami = "ami-97785bed"
  associate_public_ip_address = true
  # Tags to indentify the instace
  tags{
    Name= "CMT VPN"
    tag = "CMT VPN"
  }

  # The name of our SSH keypair
  key_name = "${var.key_name}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${aws_security_group.vivo_public_sg.id}"]

  subnet_id = "${aws_subnet.cmt-public-sub.id}"

  # force Terraform to wait until a connection can be made, so that Ansible doesn't fail when trying to provision
 # provisioner "remote-exec" {
    # The connection will use the local SSH agent for authentication
    # inline = ["echo VPN successfully connected"]

    # The connection block tells our provisioner how to communicate with the resource (instance)
    #connection {
    #  user = "${var.ec2-user}"
    #  private_key = "${file(var.private_key)}"
    #  host = "${aws_instance.vpn.public_ip}"
    #  timeout = "5m"
    # }
 # }
}