data "aws_ami" "latest_ami_id" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn*ami-hvm*"]
  }
}
