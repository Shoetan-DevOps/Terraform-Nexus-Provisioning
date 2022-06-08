resource "aws_security_group" "allow-nexus-fw" {
    name        = "allow_nexus_fw"
    description = "Allow SSH inbound traffic"
    #vpc_id = aws_vpc.main.id  
  
    ingress {
        description      = "TLS from VPC"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    }

    ingress {
        description      = "TLS from VPC"
        from_port        = 8081
        to_port          = 8081
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
       #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
       #ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      "Name" = "allow-nexus-fw"
    }
}