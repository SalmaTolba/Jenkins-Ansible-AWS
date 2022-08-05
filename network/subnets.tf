resource "aws_subnet" "first_public" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.first_public_n
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region_n}a"
}

resource "aws_subnet" "second_public" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.second_public_n
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region_n}b"
}

resource "aws_subnet" "first_private" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.first_private_n
  availability_zone = "${var.region_n}a"
}
resource "aws_subnet" "second_private" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.second_private_n
  availability_zone = "${var.region_n}b"
}
