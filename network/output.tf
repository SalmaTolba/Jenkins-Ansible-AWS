output "vpc_id_output" {
  value = aws_vpc.myvpc.id
}

output "public_subnet_id_1" {
  value = aws_subnet.first_public.id
}

output "public_subnet_id_2" {
  value = aws_subnet.second_public.id
}

output "private_subnet_id_1" {
  value = aws_subnet.first_private.id
}

output "private_subnet_id_2" {
  value = aws_subnet.second_private.id
}
