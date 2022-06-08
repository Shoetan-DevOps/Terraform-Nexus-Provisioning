resource "aws_instance" "nexus" {
    ami = var.my-ami-list["RHEL"]
    instance_type = "t2.medium"

    user_data = file("${path.module}/install-nexus.sh")

    vpc_security_group_ids = [aws_security_group.allow-nexus-fw.id]

    key_name = var.my-key-pem

    tags = {
      "Name" = "Nexus-Sandbox"
      "Source" = "Terraform"
    }

}