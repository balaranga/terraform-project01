output "vpc_id" {
  value = aws_vpc.main.id
}

output "aws_internet_gateway" {
    value = aws_internet_gateway.gw.id
}
output "security_group" {
  value = aws_security_group.my-test-sg.id
}
