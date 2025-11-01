# IAM role for eks

resource "aws_iam_role" "deploy-eks" {
  name = "eks-cluster-deploy-eks"
  tags = {
    tag-key = "eks-cluster-deploy-eks"
  }

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "eks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}

# eks policy attachment

resource "aws_iam_role_policy_attachment" "deploy-eks-AmazonEKSClusterPolicy" {
  role       = aws_iam_role.deploy-eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# bare minimum requirement of eks

resource "aws_eks_cluster" "deploy-eks" {
  name     = "deploy-eks"
  role_arn = aws_iam_role.deploy-eks.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-ap-south-1a.id,
      aws_subnet.private-ap-south-1b.id,
      aws_subnet.public-ap-south-1a.id,
      aws_subnet.public-ap-south-1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.deploy-eks-AmazonEKSClusterPolicy]
}
