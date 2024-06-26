resource "aws_instance" "ec2_demo" {
  ami                    = data.aws_ami.latest_ami_id.id
  instance_type          = var.instance_size_type["prod"]
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.webserver_security_group.id]
  count                  = lower(var.test_environment) == "y" ? 1 : 5

  tags = {
    Name = "web_server_${count.index}"
  }
}
