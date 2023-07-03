resource "aws_vpc" "main-vpc" {
  cidr_block                           = "10.0.0.0/16"
  instance_tenancy                     = "default"
  enable_network_address_usage_metrics = true

  tags = {
    Name = "${var.project}-vpc"
  }
}