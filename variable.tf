variable "region" {
    default = "us-east-2"
}

variable "aws_centos_amis" {
    default = {
        "us-east-2" = "ami-0a5588cee1fe39fff"
    }
}

variable "environment"{
    type = string
    default = "dev"
}

variable "application" {
    type = string
    default = "httpd-app"
}

#variable "key_name" {
#    type = "string"
#    #default = "ec2key"
#}

variable "mgmt_ips" {
    default = ["0.0.0.0/0"]
}
variable "key_name" {
    type = string
    default = "mykey1"
}