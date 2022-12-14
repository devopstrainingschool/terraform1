resource "aws_instance" "webserver" {
    ami = "${lookup(var.aws_centos_amis,var.region)}"
    instance_type = "t2.medium"
    tags = {
        Name = "${var.environment}-application"
        Environment = "${var.environment}"
        sshUser = "centos"
    }
    subnet_id = "${aws_subnet.webserver.id}"
    key_name = "${aws_key_pair.keypair.key_name}"
    vpc_security_group_ids = ["${aws_security_group.webserver.id}"]
}
resource "aws_instance" "database" {
    ami = "${lookup(var.aws_centos_amis,var.region)}"
    instance_type = "t2.medium"
    tags = {
        Name = "${var.environment}-database"
        Environment = "${var.environment}"
        sshUser = "centos"
    }
    subnet_id = "${aws_subnet.database.id}"
    key_name = "${aws_key_pair.keypair.key_name}"
    vpc_security_group_ids = ["${aws_security_group.webserver.id}"]
}

