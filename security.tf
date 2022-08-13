resource "aws_security_group" "LoadBalancerSG" {
    name = "LoadBalancerSG"
    vpc_id = "${aws_vpc.dts.id}"
    description = "Security group for load-balancers"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming HTTP traffic from anywhere"
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming HTTPS traffic from anywhere"
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        security_groups = ["${aws_security_group.webserver.id}"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        security_groups = ["${aws_security_group.webserver.id}"]
    }

    tags= {
        Name = "SG-Loadbalancer"
    }
}
resource "aws_security_group" "webserver" {
    name = "ApplicationSG"
    vpc_id = "${aws_vpc.dts.id}"
    description = "Security group for webservers"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming SSH traffic from Bastion Host"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        security_groups = ["${aws_security_group.LoadBalancerSG.id}"]
        description = "Allow incoming HTTP traffic from lbs"
    }
    
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        self = true
    }
    
   
    tags = {
        Name = "SG-WebServer"
    }
}

