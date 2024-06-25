resource "aws_security_group" "webserver_security_group" {
  name = "allow_web_traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_ip_cidr]
  }

  ingress {
    from_port   = var.list_of_ports[0]
    to_port     = var.list_of_ports[0]
    protocol    = "tcp"
    cidr_blocks = [var.all_ip_cidr]
  }

  ingress {
    from_port   = var.list_of_ports[1]
    to_port     = var.list_of_ports[1]
    protocol    = "tcp"
    cidr_blocks = [var.all_ip_cidr]
  }

  ingress {
    from_port   = var.list_of_ports[2]
    to_port     = var.list_of_ports[2]
    protocol    = "tcp"
    cidr_blocks = [var.all_ip_cidr]
  }
}
