# output "private_key" {
#   value     = tls_private_key.pk.private_key_pem
#   sensitive = true
# }


output "aws_security_group_id" {
    value = aws_security_group.ec2_sg.id
}