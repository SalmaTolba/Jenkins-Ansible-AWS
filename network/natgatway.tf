resource "aws_eip" "elastic_ip" {
}

resource "aws_nat_gateway" "gwnat" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.first_public.id
}
