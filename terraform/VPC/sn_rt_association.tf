resource "aws_route_table_association" "sn_rt" {
  count = length(var.sn_cidr)
  subnet_id      = element(aws_subnet.sn.*.id, count.index)
  route_table_id = aws_route_table.myrt.id
}