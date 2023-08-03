provider "aws" {
    region = "ap-south-1"
    profile = "default"
}
    resource "aws_instance" "web" {
  ami           = "ami-0ded8326293d3201b"
  instance_type = "t2.micro"

  tags = {
    Name = "bytf"
  }
    }
   