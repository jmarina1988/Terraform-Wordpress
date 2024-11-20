################################################################################
# RDS ---- Creacion de la base de datos y monitoreo 
################################################################################
resource "aws_db_instance" "rdslab5" {
  identifier              = "rdslab4"
  engine                  = "postgres"
  engine_version          = "15.8"  # versión de PostgreSQL
  instance_class          = "db.t4g.micro"
  allocated_storage       = 20
  db_name                 = "dbwordpress"
  username = "postgres"
  password = "Manolete2024"
  port                    = 5432
  iam_database_authentication_enabled = true

  vpc_security_group_ids = [
    aws_security_group.rds-sg-lab4.id
  ]

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name 
  multi_az               = true
  storage_type           = "gp3"
  backup_retention_period = 7 
  maintenance_window     = "Mon:00:00-Mon:03:00"
  final_snapshot_identifier = "db-lab4-final-snapshot" 
  deletion_protection    = false  

  monitoring_interval = 60
  monitoring_role_arn = aws_iam_role.rds_enhanced_monitoring.arn

  tags = {
    Name        = "db-lab4"
    Environment = "Test"
    Owner       = "Javier Manuel"
    Project     = "lab4"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name        = "RDS Subnet Group"
    Environment = "Test"
    Owner       = "Javier Manuel"
    Project     = "lab4"
  }
}

# Rol de monitoring
resource "aws_iam_role" "rds_enhanced_monitoring" {
  name               = "rds-enhanced-monitoring-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name        = "rds-monitoring-role"
    Environment = "Test"
    Owner       = "Javier Manuel"
    Project     = "lab4"
  }
}

# Adjuntar la política necesaria al rol
resource "aws_iam_role_policy_attachment" "rds_enhanced_monitoring" {
  role       = aws_iam_role.rds_enhanced_monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}