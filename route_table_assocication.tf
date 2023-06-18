########## Public Subnet Route Tables Association ########## 

resource "aws_route_table_association" "test-route-association-pub-eks-sub1" {
  route_table_id = aws_route_table.test-route-table-pub-eks-sub1.id
  subnet_id      = aws_subnet.test-public-eks-subnet1.id
}

resource "aws_route_table_association" "test-route-association-pub-eks-sub2" {
  route_table_id = aws_route_table.test-route-table-pub-eks-sub2.id
  subnet_id      = aws_subnet.test-public-eks-subnet2.id
}

########## Private Subnet Route Tables Association ########## 

resource "aws_route_table_association" "test-route-association-pri-eks-sub1" {
  route_table_id = aws_route_table.test-route-table-pri-eks-sub1.id
  subnet_id      = aws_subnet.test-private-eks-subnet1.id
}

resource "aws_route_table_association" "test-route-association-pri-eks-sub2" {
  route_table_id = aws_route_table.test-route-table-pri-eks-sub2.id
  subnet_id      = aws_subnet.test-private-eks-subnet2.id
}
