data "aws_availability_zones" "available" {}

# public subnet
resource "aws_subnet" "public-subnet" {
  count                   = var.subnet_counts
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.${count.index + 1}.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name    = "${var.project}-pub-${count.index + 1}"
    Project = var.project
  }
}

# private subnet
resource "aws_subnet" "private-subnet" {
  count             = var.subnet_counts
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = "10.0.${count.index + 7}.0/24"

  tags = {
    Name    = "${var.project}-pvt-${count.index + 1}"
    Project = var.project
  }
}