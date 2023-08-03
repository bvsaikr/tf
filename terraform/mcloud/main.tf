resource "aws_instance" "os" {
  ami               = "ami-008b85aa3ff5c1b02"
  instance_type     = var.x

  tags = {
    Name = "myos"
  }
}