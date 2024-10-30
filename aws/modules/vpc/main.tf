# vpc 
resource "aws_vpc" "vpc" {
    cidr_block = var.module_vpc_ipv4
    instance_tenancy = var.module_vpc_tenancy

    tags = {
        Name = var.module_vpc_tag
    }
}

# internet gateway 
resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = var.module_internet_gateway_tag
    }
}

# elastic ip 
resource "aws_eip" "elastic_ip" {
    domain = var.module_elastic_ip_domain
    network_border_group = var.module_elastic_ip_az

    tags = {
        Name = var.module_elastic_ip_tag
    }
}

# nat gateway 
resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = aws_eip.elastic_ip.id
    subnet_id = aws_subnet.public_subnet.id

    tags = {
        Name = var.module_nat_gateway_tag
    }
}

# private subnet 
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc.id
    availability_zone = var.module_private_subnet_az
    cidr_block = var.module_private_subnet_ipv4

    tags = {
        Name = var.module_private_subnet_tag
    }
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = aws_vpc.vpc.cidr_block
        nat_gateway_id = aws_nat_gateway.nat_gateway.id
    }

    tags = {
        Name = var.module_private_route_table_tag
    }
}

resource "aws_route_table_association" "private_route_table_association" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_route_table.id
}

# public subnet
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id
    availability_zone = var.module_public_subnet_az
    cidr_block = var.module_public_subnet_ipv4

    tags = {
        Name = var.module_public_subnet_tag
    }
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = aws_vpc.vpc.cidr_block
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    tags = {
        Name = var.module_public_route_table_tag
    }
}

resource "aws_route_table_association" "public_route_table_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route_table.id
}

# main route 
resource "aws_main_route_table_association" "main_route_table_association_private" {
    vpc_id = aws_vpc.vpc.id
    route_table_id = aws_route_table.private_route_table.id
}

# private security group
resource "aws_security_group" "private_security_group" {
    name = var.module_private_security_group_name
    vpc_id = aws_vpc.vpc.id
    description = var.module_private_security_group_des

    ingress {
        from_port = 0
        to_port = 0
        protocol = var.module_private_security_group_protocol_all
        cidr_blocks = [aws_vpc.vpc.cidr_block]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = var.module_private_security_group_protocol_all
        cidr_blocks = [var.module_security_group_ipv4]
    }

    tags = {
        Name = var.module_private_security_group_tag
    }
  
}

# public security group
resource "aws_security_group" "public_security_group" {
    name = var.module_public_security_group_name
    vpc_id = aws_vpc.vpc.id
    description = var.module_public_security_group_des

    ingress {
        from_port = 0
        to_port = 0
        protocol = var.module_public_security_group_protocol_all
        cidr_blocks = [aws_vpc.vpc.cidr_block]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = var.module_public_security_group_protocol_tcp
        cidr_blocks = [var.module_security_group_ipv4]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = var.module_public_security_group_protocol_tcp
        cidr_blocks = [var.module_security_group_ipv4]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = var.module_public_security_group_protocol_tcp
        ipv6_cidr_blocks = [var.module_security_group_ipv6]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = var.module_public_security_group_protocol_tcp
        cidr_blocks = [var.module_security_group_ipv4]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = var.module_public_security_group_protocol_tcp
        ipv6_cidr_blocks = [var.module_security_group_ipv6]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = var.module_public_security_group_protocol_all
        cidr_blocks = [var.module_security_group_ipv4]
    }

    tags = {
        Name = var.module_public_security_group_tag
    }
  
}