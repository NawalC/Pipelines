resource "aws_lb" "load_balancer" {

  name               = "${var.resource_name}-lb"
  internal           = false
  load_balancer_type = var.load_balancer_type
  subnets            = var.subnets
  security_groups    = var.load_balancer_type == "application" ? [var.security_groups] : null

  idle_timeout                     = var.idle_timeout
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2
  ip_address_type                  = var.ip_address_type


  tags = {
    Name        = "${var.resource_name}-lb"
    Environment = var.resource_environment
  }
}

resource "aws_lb_target_group" "tg1" {
  name        = "${local.resource_name}-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
    health_check {
      port                = 80
      protocol            = "HTTP"
      healthy_threshold   = 3
      unhealthy_threshold = 2
      timeout             = 6
      interval            = 10
      matcher             = var.load_balancer_type == "application" ? 200 : null
    }


}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTPS"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}

resource "aws_lb_target_group_attachment" "this" {
   target_group_arn = aws_lb_target_group.tg1.arn
   count            = length(var.instance_ids)
   target_id        = var.instance_ids[count.index]
   port             = 80
 }

