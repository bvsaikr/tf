provider "aws" {
    region = "ap-south-1"
    profile = "sai"
}
    resource "aws_instance" "os1forebsattachment" {
  ami           = "ami-0ded8326293d3201b"
  instance_type = "t2.micro"

  tags = {
    Name = "os1forebsattachment" 
  }
    }

    output "ec2pubip"{
      value = aws_instance.os1forebsattachment.public_ip
    }
    output "ec2az"{
      value = aws_instance.os1forebsattachment.availability_zone
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
output "ebsdata"{
  value = aws_volume_attachment.ebs_attach
}