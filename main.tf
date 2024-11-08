################################################################################
# VPC
################################################################################

module "vpc" {
 source = "terraform-aws-modules/vpc/aws"
 version =  "~> 5.0"

 name = "Lab5"
 cidr = "10.0.0.0/16"

azs             = ["us-east-1a", "us-east-1b"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]


enable_nat_gateway = true
single_nat_gateway = false
one_nat_gateway_per_az = true

enable_dns_hostnames = true
enable_dns_support = true
tags = var.tags
}

################################################################################
# ECS
################################################################################
resource "aws_ecr_repository" "wordpress" {
  name                 = "wordpress"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "wordpress" {
  repository = aws_ecr_repository.wordpress.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 5 images"
      selection = {
        tagStatus     = "any"
        countType     = "imageCountMoreThan"
        countNumber   = 5
      }
      action = {
        type = "expire"
      }
    }]
  })
}

