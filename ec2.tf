resource "aws_instance" "private" {
    ami = "ami-052064a798f08f0d3"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet.id
    availability_zone = "${var.availability_zone}a"
    iam_instance_profile = aws_iam_instance_profile.test_profile.name
    key_name = var.ssh_key
    security_groups = [ aws_security_group.docker_on_ec2.id, ]

    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y docker
                systemctl enable docker
                systemctl start docker
                usermod -a -G docker ec2-user

                EOF
    tags = {
        Name = "docker-on-ec2"  
    }
  
}


resource "aws_security_group" "docker_on_ec2" {
    description = "allow ssh to ec2"
    name = "docker_on_ec2"
    vpc_id = aws_vpc.main.id
    dynamic "ingress" {
        for_each = [ 22, 80 ]
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
      
    }
    }
    dynamic "egress" {
        for_each = [ 443, 80 ]
        content {
            from_port = egress.value
            to_port = egress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
      
    }
 
}
}