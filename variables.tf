variable "my-aws-region" {
    type = string
    default = "us-east-2"
}

variable "my-ami-list" {
    type = map
    default = {
        "AMZ" = "ami-0fa49cc9dc8d62c84"
        "RHEL" = "ami-005074b2b824595f4"
        "UBUNTU" = "ami-0aeb7c931a5a61206"
    }
}

variable "my-key-pem" {
    type = string
    default = "terraform"
}

