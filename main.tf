provider "aws" {
  region = "ap-south-1"
}
resource "aws_key_pair" "example" {
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEoHE1svLswPWIFuMB49kbm173nRgof1ILv9vQ002aXyUX5j/VER4vFzyjCEKCqA6f2wK+v0KcpgJ1YY6UK2TcYO2goJzxHzC/50SJ5MujK//QhkWwVdgrhmUQxdo/F2t0J7K9DASby6xp0QPm9DaxIiWFwIIciHjWItJT86lBtGZcYt4vp6lb2HjK1D5FYwqghBW1eJWLLVtBnOJ5l0bf56FpFQ9XYNAqnUsKGNSnCO2ARkwnnriXeGldNiU9xdxLtpXrDlRFsX5+hM7fYOFawxs1llmPie65CAD6sfj5CqRnhrmD5TbJakJuUzu9f8FzBTfoIvsUcLQXh2WXi0d7 vagrant@terraforminstance"
}

resource "aws_security_group" "examplesg" {

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "ec2instance" {
  ami                    = "ami-0a4a70bd98c6d6441"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.examplesg.id}"]
  key_name               = aws_key_pair.example.id
  tags = {
    "Name" = "my-webserver-instance"
  }
}

