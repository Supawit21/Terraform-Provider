# ---------------------------- vpc id ----------------------------
output "vpc_output" {
    value = module.aws_vpc.vpc
}

# ------------------------ private subnet ------------------------
output "private_subnet_output" {
    value = module.aws_vpc.private_subnet
}

# ------------------------ public subnet -------------------------
output "public_subnet_output" {
    value = module.aws_vpc.public_subnet
}

# --------------------- private security group -------------------
output "private_security_group_output" {
    value = module.aws_vpc.private_security_group
}

# --------------------- public security group --------------------
output "public_security_group_output" {
    value = module.aws_vpc.public_security_group
}
