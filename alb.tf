################################################################################
# ALB ---- interno 
################################################################################
resource "aws_lb" "alb-internal" {
  name               = "alb-internal"
  internal           = true  
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg-lab4.id]
  subnets            = module.vpc.private_subnets

  tags = var.tags
  }

################################################################################
# ALB ---- Target Group ---- Int
################################################################################
resource "aws_lb_target_group" "internal_alb_target_group" {
  name        = "internal-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "instance"  

  health_check {
    enabled             = true
    path                = "/salud" 
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "InternalALB-TG"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.alb-internal.arn 
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.internal_alb_target_group.arn
 }
}