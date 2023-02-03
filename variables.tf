# aws configure

# name prefix
variable "name_prefix" {
  type        = string
  default     = "tidb-test"
  description = "Name prefix"
}

# aws region
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "aws_azs" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "AWS Availability Zones"
}
  
variable "aws_vpc_cidr" {
  type        = string
  default     = "172.20.0.0/16"
  description = "AWS VPC CIDR"
}

variable "aws_private_subnets" {
  type        = list(string)
  default     = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
  description = "AWS Private Subnets"
}

variable "aws_public_subnets" {
  type        = list(string)
  default     = ["172.20.101.0/24", "172.20.102.0/24", "172.20.103.0/24"]
  description = "AWS Public Subnets"
}

## tidb configs

## servers spec

variable "tidb_instance_type" {
 type    = string
 default = "t2.medium" // prod "c4.4xlarge"
}

variable "tikv_instance_type" {
  type    = string
  default = "t2.medium" // prod : "i3.2xlarge"
}

variable "pd_instance_type" {
  type    = string
  default = "t2.medium"
}

variable "monitor_instance_type" {
  type    = string
  default = "t2.medium"
}

variable "ticdc_instance_type" {
  type    = string
  default = "t2.medium"
}

variable "bastion_instance_type" {
  type    = string
  default = "t2.medium"
}

## servers disk 

variable "root_disk_size" {
  type    = number
  default = 100
}

variable "tikv_data_disk_size" {
  type    = number
  default = 200
}

variable "tikv_data_disk_throughput" {
  type    = number
  default = 200
}

variable "pd_data_disk_size" {
  type    = number
  default = 200
}

variable "pd_data_disk_throughput" {
  type    = number
  default = 200
}

variable "ticdc_data_disk_size" {
  type    = number
  default = 200
}

variable "ticdc_data_disk_throughput" {
  type    = number
  default = 200
}

## servers count

variable "tidb_count" {
	type = number
	description = "The numble of the tidb instances to be deployed"
	default = 2
}

variable "tikv_count" {
	type = number
	description = "The numble of the tikv instances to be deployed"
	default = 3
}

variable "pd_count" {
	type = number
	description = "The numble of the pd instances to be deployed"
	default = 3
}

variable "ticdc_count" {
  type = number
  description = "The numble of the ticdc worker instances to be deployed"
  default = 2
}

## tags 

variable "tags" {
    type = map(string)
    default = {
        "Owner" = "tf-aws-tidb",
        "Project" = "AWS TiDB Cluster",
    }
    description = "The tags to be added to the resources"
}

## bastion allow ssh from
variable "bastion_allow_ssh_from" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
## internal tidb lb allow from
variable "tidb_lb_allow_from" {
  type        = list(string)
  default     = ["172.20.0.0/16"]
}