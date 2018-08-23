resource "aws_instance" "jenkins" {
  instance_type = "t2.micro"
  ami           = "ami-97785bed"

  # Tags to indentify the instace
  tags {
    Name = "jenkins"
    tag  = "jenkins"
  }

  # The name of our SSH keypair
  key_name = "${var.key_name}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${aws_security_group.vivo_private_sg.id}"]

  subnet_id = "${aws_subnet.vivo-subnet.id}"
}
