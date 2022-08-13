resource "aws_route_table" "internet-default" {
  vpc_id = "${aws_vpc.dts.id}"

  route {
      cidr_block = "0.0.0.0/0" # Defines default route 
      gateway_id = "${aws_internet_gateway.inetgw.id}" # via IGW
  }

  tags = {
      Name = "Route-Table-Default"
  }
}

resource "aws_route_table_association" "webserver" {
  subnet_id = "${aws_subnet.webserver.id}"
  route_table_id = "${aws_route_table.internet-default.id}"
}

resource "aws_route_table_association" "database" {
  subnet_id = "${aws_subnet.database.id}"
  route_table_id = "${aws_route_table.internet-default.id}"
}

