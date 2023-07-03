# public internet
resource "aws_internet_gateway" "igw" {
  tags = {
    Name    = "${var.project}-igw"
    Project = var.project
  }
}

resource "aws_internet_gateway_attachment" "igw-attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.main-vpc.id
}

# public routing
resource "aws_route_table" "route-pub" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name    = "${var.project}-rt-pub"
    Project = var.project
  }
}

resource "aws_route_table_association" "rt-association-pub" {
  count          = var.subnet_counts
  route_table_id = aws_route_table.route-pub.id
  subnet_id      = aws_subnet.public-subnet.*.id[count.index]
}

# private routing

resource "aws_route_table" "route-prv" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name    = "${var.project}-rt-pvt"
    Project = var.project
  }
}

resource "aws_route_table_association" "rt-association-prv" {
  count          = var.subnet_counts
  route_table_id = aws_route_table.route-prv.id
  subnet_id      = aws_subnet.private-subnet.*.id[count.index]
}