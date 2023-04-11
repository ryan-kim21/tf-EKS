
########## Public Subnet Route Tables ########## 

resource "aws_route_table" "test-route-table-pub-eks-sub1" {

  depends_on = [
    aws_vpc.test-vpc,
    aws_internet_gateway.test-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-internet-gateway.id
  }

  tags = {
    Name = "test-route-table-pub-sub1"
  }

  tags_all = {
    Name = "test-route-table-pub-sub1"
  }

  vpc_id = aws_vpc.test-vpc.id
}

resource "aws_route_table" "test-route-table-pub-eks-sub2" {

  depends_on = [
    aws_vpc.test-vpc,
    aws_internet_gateway.test-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-internet-gateway.id
  }

  tags = {
    Name = "test-route-table-pub-sub2"
  }

  tags_all = {
    Name = "test-route-table-pub-sub2"
  }

  vpc_id = aws_vpc.test-vpc.id
}


########## Private Subnet Route Tables ########## 

resource "aws_route_table" "test-route-table-pri-eks-sub1" {

  depends_on = [
    aws_vpc.test-vpc,
    aws_nat_gateway.test-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.test-nat-gateway.id
  }

  tags = {
    Name = "test-route-table-pri-eks-sub1"
  }

  tags_all = {
    Name = "test-route-table-pri-eks-sub1"
  }

  vpc_id = aws_vpc.test-vpc.id
}

resource "aws_route_table" "test-route-table-pri-eks-sub2" {

  depends_on = [
    aws_vpc.test-vpc,
    aws_nat_gateway.test-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.test-nat-gateway.id
  }

  tags = {
    Name = "test-route-table-pri-eks-sub2"
  }

  tags_all = {
    Name = "test-route-table-pri-eks-sub2"
  }

  vpc_id = aws_vpc.test-vpc.id
}