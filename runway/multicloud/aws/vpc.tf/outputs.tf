output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "pub_sub_1_id" {
  value = aws_subnet.pub-sub-1.id
}

output "pub_sub_2_id" {
  value = aws_subnet.pub-sub-2.id
}

output "pri_sub_1_id" {
  value = aws_subnet.pri-sub-1.id
}

output "pri_sub_2_id" {
  value = aws_subnet.pri-sub-2.id
}