resource "aws_elb" "lb" {
    name_prefix = "${var.environment}-"
    subnets = ["${aws_subnet.webserver.id}", "${aws_subnet.database.id}"]
    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        target = "TCP:8080"
        interval = 30
    }
    listener {
        instance_port = 8080
        instance_protocol = "http"
        lb_port = 8080
        lb_protocol = "http"
    }
    cross_zone_load_balancing = true
    instances = ["${aws_instance.webserver.id}", "${aws_instance.webserver.id}"]
    security_groups = ["${aws_security_group.LoadBalancerSG.id}"]
}
 
 resource "aws_lb_cookie_stickiness_policy" "gitlab" {
  name                     = "gitlab-policy"
  load_balancer            = "${aws_elb.lb.id}"
  lb_port                  = 8080
  cookie_expiration_period = 600
}