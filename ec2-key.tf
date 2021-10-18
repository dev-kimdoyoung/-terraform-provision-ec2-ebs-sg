resource "aws_key_pair" "ec2_admin_key" {
  key_name = "ec2_admin"
  public_key = file("~/.ssh/ec2_admin.pub")
}