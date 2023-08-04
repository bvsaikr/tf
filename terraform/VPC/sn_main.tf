resource "aws_subnet" "sn" {
  count = length(var.sn_cidr)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.sn_cidr,count.index)
  availability_zone = element(var.sn_az,count.index)
  # or we can write like this var.sn_az[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "sn${count.index}"
  }
}