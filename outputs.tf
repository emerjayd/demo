output "ec2_demo_ip_output" {
  value = aws_instance.ec2_demo[0].public_ip
}

output "ec2_demo_arn_output" {
  value = aws_instance.ec2_demo[0].arn
}
