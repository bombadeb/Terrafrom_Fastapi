data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  #depends_on = [aws_key_pair.kp]

  #VPC Subnet
  subnet_id = "${var.my_subnet_id}"

  root_block_device {
    volume_size = 10
  }

  user_data = "${file("../modules/EC2/install_docker.sh")}"
  
  vpc_security_group_ids = ["${var.aws_security_group_id}"]

  iam_instance_profile = "${var.aws_ec2_iam_instance_profile}"

  tags = {
    project = "fastapi",
    Owner = "Test"
  }

  key_name                = "ec2-instance-key"
  monitoring              = true
  # disable_api_termination = false
  # ebs_optimized           = true
}