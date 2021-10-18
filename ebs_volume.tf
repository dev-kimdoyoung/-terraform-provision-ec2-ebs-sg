resource "aws_ebs_volume" "ec2-volume" {
    availability_zone = "ap-northeast-2a"
    size              = 200
    encrypted         = true
    tags = {
        Name = "oracle-volume"
      }
  }

resource "aws_volume_attachment" "attach-my-ebs-volume-with-ec2" {
    device_name = "/dev/sdb"
    volume_id   = "${aws_ebs_volume.ec2-volume.id}"
    instance_id = "${aws_instance.my_ec2_node.id}"
}