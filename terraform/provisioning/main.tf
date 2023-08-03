# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  profile = "sai"
}
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
 resource "aws_instance" "os" {
  ami           = "ami-0ded8326293d3201b"
  instance_type = "t2.micro"
  security_groups = ["allow_tls"]
  key_name = "awsnew"

  tags = {
    Name = "osforprovisioning" 
  }
 }
   resource "aws_ebs_volume" "myebs" {
  availability_zone = aws_instance.os1forebsattachment.availability_zone
  size              = 10

  tags = {
    Name = "ebscreation"
  }
}
resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myebs.id
  instance_id = aws_instance.os1forebsattachment.id
}
 resource "null_resource" "torunconfigs" {
depends_on[aws_volume_attachment.ebs_attach]  #explicitly mentioning order if we run without depends on terraform willuse its intelligence and runn which is not same as our requirement

    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/Administrator/Documents/awskey/awskey.pem")
    host     = aws_instance.os.public_ip
  }
   provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }
    provisioner "remote-exec" {         #partitioning and mounting volume for the httpd server
    inline = [
      "sudo mkfs.ext4 /dev/xvdc",
      "sudo mount /dev/xvdc var/html",
      "sudo yum install git -y",
      "sudo git clone abc.git var/html"
    ]
  }
 }
   resource "null_resource" "localcon" {
     provisioner "remote-exec" {
      command = "chrome http://1.233.23.3/abc"
     }
 }
    
