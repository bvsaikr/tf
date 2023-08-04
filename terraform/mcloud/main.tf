resource "aws_instance" "os" {
  ami               = "ami-008b85aa3ff5c1b02"
  instance_type     = var.x
  availability_zone = var.avzone[1]
  count = var.istrue? 1 : 0
  tags = {
    Name = "myos"
  }
}
