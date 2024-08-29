# nlb module outputs.tf
output "aws_lb_target_group_arn" {
  value = aws_lb_target_group.tg.arn
}
