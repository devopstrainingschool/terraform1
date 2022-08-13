resource "aws_internet_gateway" "inetgw" {
  vpc_id = "${aws_vpc.dts.id}"
  tags = {
      Name = "IGW-VPC-${var.environment}-Default"
  }
}
