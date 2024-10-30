# vpc id
output "vpc" {
    value = aws_vpc.vpc.id
}

# private subnet 
output "private_subnet" {   
    value = aws_subnet.private_subnet.id
}

# public subnet 
output "public_subnet" {
    value = aws_subnet.public_subnet.id
}

# private security group 
output "private_security_group" {
    value = aws_security_group.private_security_group.id
}

# public security group 
output "public_security_group" {
    value = aws_security_group.public_security_group.id
}