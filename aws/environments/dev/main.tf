# module vpc
module "aws_vpc" {
    source = "../../modules/vpc"
    providers = {aws = aws.singapore}

    module_vpc_ipv4 = var.vpc_ipv4
    module_vpc_tenancy = var.vpc_tenancy
    module_vpc_tag = var.vpc_tag

    module_internet_gateway_tag = var.internet_gateway_tag

    module_elastic_ip_domain = var.elastic_ip_domain
    module_elastic_ip_az = var.elastic_ip_az
    module_elastic_ip_tag = var.elastic_ip_tag

    module_nat_gateway_tag = var.nat_gateway_tag

    module_private_subnet_ipv4 = var.private_subnet_ipv4
    module_private_subnet_az = var.private_subnet_az
    module_private_subnet_tag = var.private_subnet_tag

    module_private_route_table_tag = var.private_route_table_tag

    module_public_subnet_ipv4 = var.public_subnet_ipv4
    module_public_subnet_az = var.public_subnet_az
    module_public_subnet_tag = var.public_subnet_tag

    module_public_route_table_tag = var.public_route_table_tag

    module_private_security_group_name = var.private_security_group_name
    module_private_security_group_des = var.private_security_group_des
    module_private_security_group_protocol_all = var.private_security_group_protocol_all
    module_private_security_group_tag = var.private_security_group_tag

    module_security_group_ipv4 = var.security_group_ipv4

    module_public_security_group_name = var.public_security_group_name
    module_public_security_group_des = var.public_security_group_des
    module_public_security_group_protocol_all = var.public_security_group_protocol_all
    module_public_security_group_protocol_tcp = var.public_security_group_protocol_tcp
    module_public_security_group_tag = var.public_security_group_tag

    module_security_group_ipv6 = var.security_group_ipv6
}

# module ec2
module "aws_ec2" {
    source = "../../modules/ec2"
    providers = {aws = aws.singapore}

    module_ami_ubuntu_20 = var.ami_ubuntu_20
    module_instance_type = var.instance_type
    module_key_pair = var.key_pair

    module_subnet = var.subnet
    module_security_group = var.security_group

    module_volume_size = var.volume_size
    module_volume_type = var.volume_type
    
    module_elastic_ip_tag = var.elastic_ip_tag
    module_tag_name = var.tag_name
}
