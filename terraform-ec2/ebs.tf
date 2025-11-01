resource "aws_ebs_volume" "postgres_data" {
  availability_zone = "ap-south-1a"   # Must match your EKS node AZ
  size              = 20
  type              = "gp3"
  tags = {
    Name = "postgres-data-volume"
  }
}

# resource "aws_ebs_snapshot" "postgres_backup" {
#   volume_id = aws_ebs_volume.postgres_data.id
#   tags = {
#     Name = "postgres-backup"
#   }
# }
