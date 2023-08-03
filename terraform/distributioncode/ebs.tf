  resource "aws_ebs_volume" "myebs" {
  availability_zone = aws_instance.os.availability_zone
  size              = 10

  tags = {
    Name = "ebscreation"
  }
  }