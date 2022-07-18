output "vpc_id" {
    value = aws_vpc.main.id
    description = "ID for the vpc"
}

output "public_subnet_id" {
    value = aws_subnet.public.*.id
    description = "ID for the public subnet"
}

output "private_subnet_id" {
    value = aws_subnet.private.*.id
    description = "ID for the private subnet"
}