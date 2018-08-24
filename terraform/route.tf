# Create public route table
resource "aws_route_table" "public-route-table" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "Public Route Table"
  }
}

resource "aws_route" "public-route" {
  route_table_id         = "${aws_route_table.public-route-table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

resource "aws_route_table_association" "public-route-assossiation" {
  subnet_id      = "${aws_subnet.public-sub.id}"
  route_table_id = "${aws_route_table.public-route-table.id}"
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "Internet Gateway"
  }
}
