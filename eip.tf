resource "aws_eip" "instance_ip_address" {
  count  = lower(var.test_environment) == "y" ? 1 : 5
  domain = "vpc"
}

resource "aws_eip_association" "aws_eip_assoc" {
  count          = lower(var.test_environment) == "y" ? 1 : 5
  instance_id    = aws_instance.ec2_demo[count.index].id
  allocation_id  = aws_eip.instance_ip_address[count.index].id
}
