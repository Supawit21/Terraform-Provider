# Terraform provisioning aws

## Configure the AWS Provider (vpc.tf,ec2.tf)
```
# Configure the AWS Provider
provider "aws" {
    region     = "ap-northeast-2" // region for provisioning 
}
```

## Set environment variables (access_key_id,secret_access_key)
```
$env:AWS_ACCESS_KEY_ID="access_key_id"
$env:AWS_SECRET_ACCESS_KEY="secret_access_id"
```
**Check environment variables**
```
$env:AWS_ACCESS_KEY_ID
$env:AWS_SECRET_ACCESS_KEY
```

## Path script `script-aws/script-vpc/vpc.tf` (Examples)
```
# Create vpc
resource "aws_vpc" "vpc" {
    cidr_block       = "xx.xx.xx.xx/xx"
    instance_tenancy = "default"

    tags = {
        Name = "xxxxxx"
    }
}

# Create subnet-private
resource "aws_subnet" "subnet-private" {
    vpc_id = aws_vpc.vpc.id 
    availability_zone = "ap-northeast-2c"
    cidr_block = "xx.xx.xx.xx/xx"

    tags = {
        Name = "xxxxxx"
    }
}
```

## Path script `script-aws/script-ec2/ec2.tf` (Examples)
```
# Create instance on aws
resource "aws_instance" "instance"{
    ami = "ami-xxxxxx" // ami for image by select
    instance_type = "t2.micro"
    key_name = var.aws_key_pair 
    subnet_id = var.aws_subnet_public
    vpc_security_group_ids = [var.security_group_public]
    # user_data = file("xxxxxx.sh") // user-data for run package script

    root_block_device {
        volume_size = 30
        volume_type = "gp2" // Valid values standard, gp2, gp3 etc. Default to gp2
    }

    tags = {
      Name = "xxxxxx"
    }

}
```

## Path script `script-aws/script-ec2/variables.tf` (Examples)
```
# Default key_pair
variable "aws_key_pair" {
    type = string
    default = "private-key-01"
}

# Default subnet_id
variable "aws_subnet_private" {
    type = string
    default = "subnet-xxxxxx"
}

# Default subnet_id
variable "aws_subnet_public" {
    type = string
    default = "subnet-xxxxxx"
}

# Default security_group_id
variable "security_group_private" {
    type = string
    default = "sg-xxxxxx"
}

# Default security_group_id
variable "security_group_public" {
    type = string
    default = "sg-xxxxxx"
}
```

## Path script `outputs.tf` (Examples)
```
# Show outputs vpc_id
output "vpc" {
    value = aws_vpc.vpc.id
}

# Show outputs subnet_id
output "subnet-public" {   
    value = aws_subnet.subnet-private.id
}

# Show outputs subnet_id
output "subnet-public" {
    value = aws_subnet.subnet-public.id
}

# Show outputs security_group_id
output "security_group_private" {
    value = aws_security_group.security_group_private.id
}

# Show outputs security_group_id
output "security_group_public" {
    value = aws_security_group.security_group_public.id
}
```
**Example outputs show cli**
```
// Command line outputs after terraform apply
vpc = "vpc-xxxxxx"
subnet_private = "subnet-xxxxxx"
subnet_public  = "subnet-xxxxxx"
security_group_private = "sg-xxxxxx"
security_group_public  = "sg-xxxxxx"
```

## Run CLI for terraform require provider aws
```
terraform init
```

## Run CLI for creates an execution plan, Check preview provisioning
```
terraform plan
```

## Run CLI for executes the actions proposed in a Terraform plan
```
terraform apply
```

## Run CLI for destroy state provisioning on aws
```
terraform destroy
```

# Document registry provider aws

- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

# Document registry provider tencent

- [tencent cloud](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs)