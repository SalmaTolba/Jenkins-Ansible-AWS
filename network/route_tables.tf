##########public_route
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
resource "aws_route_table_association" "first_public" {
  subnet_id      = aws_subnet.first_public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "second_public" {
  subnet_id      = aws_subnet.second_public.id
  route_table_id = aws_route_table.public.id
}

##########private_route
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gwnat.id
}
resource "aws_route_table_association" "first_private" {
  subnet_id      = aws_subnet.first_private.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "second_private" {
  subnet_id      = aws_subnet.second_private.id
  route_table_id = aws_route_table.private.id
}