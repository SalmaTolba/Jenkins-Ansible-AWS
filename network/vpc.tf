resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_vpc_n
  tags = {
    Name = "myvpc"
  }

}