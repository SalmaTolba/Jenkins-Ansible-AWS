# create a target group for application load balancer
resource "aws_lb_target_group" "app-lb-target" {
  name     = "app-lb"
  port     = "3000"
  protocol = "HTTP"
  vpc_id   = module.network_module.vpc_id_output
}

#target group attachment
resource "aws_lb_target_group_attachment" "app-target-attach" {
  target_group_arn = aws_lb_target_group.app-lb-target.arn
  target_id        = aws_instance.myapp.id
  port             = "3000"
}


# create an application load balancer
resource "aws_lb" "app-lb" {
  name                       = "app-lb"
  internal                   = false
  security_groups            = [aws_security_group.sg-all.id]
  subnets                    = [module.network_module.public_subnet_id_1, module.network_module.public_subnet_id_2]
  ip_address_type            = "ipv4"
  enable_deletion_protection = false
}

# to attach targetg to loadbalancer
resource "aws_alb_listener" "app-lb-listener" {  
  load_balancer_arn =  aws_lb.app-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {    
    target_group_arn = aws_lb_target_group.app-lb-target.arn
    type             = "forward"  
  }
}