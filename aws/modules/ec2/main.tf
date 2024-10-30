# elastic ip for public instance
resource "aws_eip" "public_instance" {
    count = var.module_status_elastic_ip ? 1 : 0

    domain = var.module_elastic_ip
    network_border_group = var.module_elastic_ip_az

    tags = {
        Name = var.module_elastic_ip_tag
    }
}

resource "aws_eip_association" "public_instance_association" {
    count = var.module_status_elastic_ip ? 1 : 0
    instance_id = aws_instance.instance.id
    allocation_id = aws_eip.public_instance.id 
}

# create instance
resource "aws_instance" "instance"{
    ami = var.module_ami_ubuntu_20
    instance_type = var.module_instance_type
    key_name = var.module_key_pair
    subnet_id = var.module_subnet
    vpc_security_group_ids = [var.module_security_group]

    root_block_device {
        volume_size = var.module_volume_size
        volume_type = var.module_volume_type
    }

    tags = {
        Name = var.module_tag_name
    }

}
