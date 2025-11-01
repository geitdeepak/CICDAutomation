# private subnet 01

resource "aws_subnet" "private-ap-south-1a" {
  vpc_id            = aws_vpc.k8svpc.id
  cidr_block        = "192.168.0.0/19"
  availability_zone = "ap-south-1a"

  tags = {
    Name                               = "private-ap-south-1a"
    "kubernetes.io/role/internal-elb"  = "1"
    "kubernetes.io/cluster/deploy-eks" = "owned"
  }
}
# private subnet 02

resource "aws_subnet" "private-ap-south-1b" {
  vpc_id            = aws_vpc.k8svpc.id
  cidr_block        = "192.168.32.0/19"
  availability_zone = "ap-south-1b"

  tags = {
    Name                               = "private-ap-south-1b"
    "kubernetes.io/role/internal-elb"  = "1"
    "kubernetes.io/cluster/deploy-eks" = "owned"
  }
}

# public subnet 01

resource "aws_subnet" "public-ap-south-1a" {
  vpc_id                  = aws_vpc.k8svpc.id
  cidr_block              = "192.168.64.0/19"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                               = "public-ap-south-1a"
    "kubernetes.io/role/elb"           = "1" #this instruct the kubernetes to create public load balancer in these subnets
    "kubernetes.io/cluster/deploy-eks" = "owned"
  }
}
# public subnet 02

resource "aws_subnet" "public-ap-south-1b" {
  vpc_id                  = aws_vpc.k8svpc.id
  cidr_block              = "192.168.96.0/19"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                               = "public-ap-south-1b"
    "kubernetes.io/role/elb"           = "1" #this instruct the kubernetes to create public load balancer in these subnets
    "kubernetes.io/cluster/deploy-eks" = "owned"
  }
}
