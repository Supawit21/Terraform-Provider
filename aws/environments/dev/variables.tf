# vpc
variable "vpc_ipv4" {
    type = string
    description = "IPv4 CIDR block for the VPC"
}

variable "vpc_tenancy" {
    type = string
    default = "default"
    description = "A tenancy option for instances launched into the VPC"
}

variable "vpc_tag" {
    type = string
    description = "Tag name for VPC"
}

# internet gateway
variable "internet_gateway_tag" {
    type = string
    description = "Tag name for internet gateway"
}

# elastic ip
variable "elastic_ip_domain" {
    type = string
    default = "vpc"
    description = "Indicates if this EIP is for use in VPC"
}

variable "elastic_ip_az" {
    type = string
    default = "ap-southeast-1"
    description = "Location from which the IP address is advertised"
}

variable "elastic_ip_tag" {
    type = string
    description = "Tag name for elastic ip"
}

# nat gateway
variable "nat_gateway_tag" {
    type = string
    description = "Tag name for nate gateway"
}

# private subnet
variable "private_subnet_ipv4" {
    type = string
    description = "IPv4 CIDR block for the subnet"
}

variable "private_subnet_az" {
    type = string
    description = "Availability zone for the subnet"
}

variable "private_subnet_tag" {
    type = string
    description = "Tag name for subnet" 
}

variable "private_route_table_tag" {
    type = string
    description = "Tag name for route table"
}

# public subnet
variable "public_subnet_ipv4" {
    type = string
    description = "IPv4 CIDR block for the subnet"
}

variable "public_subnet_az" {
    type = string
    description = "Availability zone for the subnet"
}

variable "public_subnet_tag" {
    type = string
    description = "Tag name for subnet" 
}

variable "public_route_table_tag" {
    type = string
    description = "Tag name for route table"
}

# private security group
variable "private_security_group_name" {
    type = string
    description = "Name of the security group"
}

variable "private_security_group_des" {
    type = string
    description = "Security group description"
}

variable "private_security_group_protocol_all" {
    type = string
    default = "-1"
    description = "Protocol. If you select a protocol of -1 = all. you must specify a from_port and to_port equal to 0"
}

variable "private_security_group_tag" {
    type = string
    description = "Tag name for security group"
}

# cidr security group
variable "security_group_ipv4" {
    type = string
    default = "0.0.0.0/0"
    description = "List of CIDR blocks"
}

variable "security_group_ipv6" {
    type = string
    default = "::/0"
    description = "List of CIDR blocks ipv6"
}

# public security group
variable "public_security_group_name" {
    type = string
    description = "Name of the security group"
}

variable "public_security_group_des" {
    type = string
    description = "Security group description"
}

variable "public_security_group_protocol_all" {
    type = string
    default = "-1"
    description = "Protocol. If you select a protocol of -1 = all. you must specify a from_port and to_port equal to 0"
}

variable "public_security_group_protocol_tcp" {
    type = string
    default = "tcp"
    description = "Protocol rule tcp"
}

variable "public_security_group_tag" {
    type = string
    description = "Tag name for security group"
}

# ----------------------------------------------------------------------------------------------------------------------------------------

# ami
variable "ami_ubuntu_20" {
    type = string
    description = "AMI to use for the instance (Ubuntu 20.04 LTS)"
}

# instance type
variable "instance_type" {
    type = string
    description = "Instance type to use for the instance"
}

# key pair
variable "key_pair" {
    type = string
    description = "Key name of the Key Pair to use for the instance"
}

# subnet
variable "subnet" {
    type = string
    description = "VPC Subnet ID to launch"
}

# security group
variable "security_group" {
    type = string
    description = "List of security group IDs to associate"
}

# volume size
variable "volume_size" {
    type = string
    description = "Size of the volume in gibibytes (GiB)"
}

# volume type
variable "volume_type" {
    type = string
    default = "gp3"
    description = "Type of volume"
}

# tag name
variable "tag_name" {
    type = string
    description = "Instance tag name"
}

# elastic ip
variable "elastic_ip" {
    type = string
    default = "domain"
    description = "Indicates if this EIP is for use in VPC"
}

variable "elastic_ip_az" {
    type = string
    default = "ap-southeast-1"
    description = "Location from which the IP address is advertised"
}

variable "elastic_ip_tag" {
    type = string
    description = "Tag name for elastic ip"
}

# check public instance
variable "status_elastic_ip" {
    type = bool
    default = false
}