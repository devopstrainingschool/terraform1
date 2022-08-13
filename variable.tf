variable "region" {
    default = "us-east-2"
}

variable "aws_centos_amis" {
    default = {
        "us-east-2" = "CentOS-7-2111-20220330_2.x86_64-d9a3032a-921c-4c6d-b150-bde168105e42
ami-0a5588cee1fe39fff"
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