
resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.LoadBalancerSG.id}"]
  subnets            = ["${aws_subnet.webserver.id}","${aws_subnet.database.id}"]
  


  tags = {
    Environment = "production"
  }
}