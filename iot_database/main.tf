resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier           = var.cluster_identifier
  engine                       = "aurora-mysql"
  master_username              = var.master_username
  master_password              = var.master_password
  vpc_security_group_ids       = [aws_security_group.aurora_security_group.id]
  skip_final_snapshot          = true
  final_snapshot_identifier    = "final-cluster-snapshot"
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  count              = 1
  identifier         = "iot-database-raw"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.aurora_cluster.engine
  engine_version     = aws_rds_cluster.aurora_cluster.engine_version
}

resource "aws_security_group" "aurora_security_group" {
  name        = "aurora-security-group"
  description = "Security group for Aurora MySQL"
  
  # Default settings for ingress and egress rules
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
