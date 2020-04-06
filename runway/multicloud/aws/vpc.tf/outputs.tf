output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "pub_sub_1_id" {
  value = aws_subnet.pub_sub_1.id
}

output "pub_sub_2_id" {
  value = aws_subnet.pub_sub_2.id
}

output "pri_sub_1_id" {
  value = aws_subnet.pri_sub_1.id
}

output "pri_sub_2_id" {
  value = aws_subnet.pri_sub_2.id
}