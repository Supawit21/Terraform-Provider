# vpc
variable "module_vpc_ipv4" {
    type          = string
    description   = "IPv4 CIDR block for the VPC"
}

variable "module_vpc_tenancy" {
    type          = string
    description   = "A tenancy option for instances launched into the VPC"
}

variable "module_vpc_tag" {
    type          = string
    description   = "Tag name for VPC"
}

# internet gateway
variable "module_internet_gateway_tag" {
    type          = string
    description   = "Tag name for internet gateway"
}

# elastic ip
variable "module_elastic_ip_domain" {
    type          = string
    description   = "Indicates if this EIP is for use in VPC"
}

variable "module_elastic_ip_az" {
    type          = string
    description   = "Location from which the IP address is advertised"
}

variable "module_elastic_ip_tag" {
    type          = string
    description   = "Tag name for elastic ip"
}

# nat gateway
variable "module_nat_gateway_tag" {
    type          = string
    description   = "Tag name for nate gateway"
}

# private subnet
variable "module_private_subnet_ipv4" {
    type          = string
    description   = "IPv4 CIDR block for the subnet"
}

variable "module_private_subnet_az" {
    type          = string
    description   = "Availability zone for the subnet"
}

variable "module_private_subnet_tag" {
    type          = string
    description = "Tag name for subnet" 
}

variable "module_private_route_table_tag" {
    type          = string
    description   = "Tag name for route table"
}

# public subnet
variable "module_public_subnet_ipv4" {
    type          = string
    description   = "IPv4 CIDR block for the subnet"
}

variable "module_public_subnet_az" {
    type          = string
    description   = "Availability zone for the subnet"
}

variable "module_public_subnet_tag" {
    type          = string
    description = "Tag name for subnet" 
}

variable "module_public_route_table_tag" {
    type          = string
    description   = "Tag name for route table"
}

# private security group
variable "module_private_security_group_name" {
    type          = string
    description   = "Name of the security group"
}

variable "module_private_security_group_des" {
    type          = string
    description   = "Security group description"
}

variable "module_private_security_group_protocol_all" {
    type          = string
    description   = "Protocol. If you select a protocol of -1 = all. you must specify a from_port and to_port equal to 0"
}

variable "module_private_security_group_tag" {
    type          = string
    description   = "Tag name for security group"
}

# cidr security group
variable "module_security_group_ipv4" {
    type          = string
    description   = "List of CIDR blocks ipv4"
}

variable "module_security_group_ipv6" {
    type          = string
    description   = "List of CIDR blocks ipv6"
}

# public security group
variable "module_public_security_group_name" {
    type          = string
    description   = "Name of the security group"
}

variable "module_public_security_group_des" {
    type          = string
    description   = "Security group description"
}

variable "module_public_security_group_protocol_all" {
    type          = string
    description   = "Protocol. If you select a protocol of -1 = all. you must specify a from_port and to_port equal to 0"
}

variable "module_public_security_group_protocol_tcp" {
    type          = string
    description   = "Protocol rule tcp"
}

variable "module_public_security_group_tag" {
    type          = string
    description   = "Tag name for security group"
}