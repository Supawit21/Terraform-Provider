# ami
variable "module_ami_ubuntu_20" {
    type = string
    description = "AMI to use for the instance (Ubuntu 20.04 LTS)"
}

# instance type
variable "module_instance_type" {
    type = string
    description = "Instance type to use for the instance"
}

# key pair
variable "module_key_pair" {
    type = string
    description = "Key name of the Key Pair to use for the instance"
}

# subnet
variable "module_subnet" {
    type = string
    description = "VPC Subnet ID to launch"
}

# security group
variable "module_security_group" {
    type = string
    description = "List of security group IDs to associate"
}

# volume size
variable "module_volume_size" {
    type = string
    description = "Size of the volume in gibibytes (GiB)"
}

# volume type
variable "module_volume_type" {
    type = string
    default = "gp3"
    description = "Type of volume"
}

# tag name
variable "module_tag_name" {
    type = string
    description = "Instance tag name"
}

# elastic ip
variable "module_elastic_ip" {
    type = string
    default = "domain"
    description = "Indicates if this EIP is for use in VPC"
}

variable "module_elastic_ip_az" {
    type = string
    default = "ap-southeast-1"
    description = "Location from which the IP address is advertised"
}

variable "module_elastic_ip_tag" {
    type = string
    description = "Tag name for elastic ip"
}

# check public instance
variable "module_status_elastic_ip" {
    type = bool
    default = false
}