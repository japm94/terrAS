# Create a VPC to launch our instances into
resource "aws_vpc" "cmt" {
  cidr_block = "10.2.0.0/16"
  tags {
    Name= "cmt"
  }
}

# Create public subnet
resource "aws_subnet" "public-sub" {
  vpc_id      ="${aws_vpc.cmt.id}"
  cidr_block              = "10.2.0.0/24"
  map_public_ip_on_launch = true
  tags {
    Name= "CMT Public SUBNET"
  }
}

# Our public Security Group for
# connect the VPN
resource "aws_security_group" "vivo_public_sg" {
  vpc_id      ="${aws_vpc.cmt.id}"
  tags {
    Name="vivo_public_sg"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}