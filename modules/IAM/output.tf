output "aws_iam_instance_profile" {
    value = "${aws_iam_instance_profile.ec2_profile.name}"
    description = "IAM instance profile name for Ec2 instances"
  
}

