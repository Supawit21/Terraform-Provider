# private ip 
output "private_IPv4_addresses" {
    value = aws_instance.instance.private_ip
}
