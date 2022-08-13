resource "aws_subnet" "webserver" {
  availability_zone = "" 
  cidr_block = "10.0.1.0/24" 
  map_public_ip_on_launch = true 
  vpc_id = "${aws_vpc.dts.id}" #
  tags {
      Name = "webserver" 
  }
}


resource "aws_subnet" "database" {
  availability_zone = "" 
  cidr_block = "10.0.2.0/24" 
  map_public_ip_on_launch = true 
  vpc_id = "${aws_vpc.dts.id}" #
  tags {
      Name = "database" 
  }
}

