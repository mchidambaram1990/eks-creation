# Created VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = map(
    "Name", "terraform-eks-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )
}

# Created subnet
resource "aws_subnet" "subnet_main" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = "10.0.${count.index}.0/24"
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true

  tags = map(
    "Name", "terraform-eks-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )
}

# Created Internet_Gateway
resource "aws_internet_gateway" "ig_main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-eks-ig"
  }
}

# Created Route Table
resource "aws_route_table" "rt_main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_main.id
  }
}

# Created Route Table Association
resource "aws_route_table_association" "rt_routeTable_association" {
  count = 2

  subnet_id      = aws_subnet.subnet_main.*.id[count.index]
  route_table_id = aws_route_table.rt_main.id
}
