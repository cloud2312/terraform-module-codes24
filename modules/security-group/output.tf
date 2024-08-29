output "vpc_id" {
  value = var.vpc_id
}
output "nlb_security_group_id" {
  value = aws_security_group.nlb_security_group.id
}
/*
output "ecs_security_group_id" {
  value = aws_security_group.ecs_security_group.id
}
*/
output "public_security_group_id" {
  value = aws_security_group.public_security_group.id
}