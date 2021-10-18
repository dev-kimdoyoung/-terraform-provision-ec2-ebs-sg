resource "aws_instance" "my_ec2_node" {
	ami					= "ami-0708fd0ae9a663e02"	# RHEL 7
	instance_type		= "t2.small"				# Memory 2 GB
	key_name            	= aws_key_pair.ec2_admin_key.key_name

	associate_public_ip_address	= true				# give a Public IP

	# include VPC Security Group
	vpc_security_group_ids = [
		aws_security_group.allow_SSH.id
	]

	tags = {
		Name = "my-ec2-node"
	}
}

# 방화벽 22번 포트 오픈
resource "aws_security_group" "allow_SSH" {
  name = "allow_ssh_from_all"
  description = "Allow SSH port from all"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0"]
    from_port = -1
    protocol = "-1"
    to_port = -1
  }
}
