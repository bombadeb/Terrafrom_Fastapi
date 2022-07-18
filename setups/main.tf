module "cloud_network" {
  source = "../modules/Network"
  az_count = "${var.az_count}"
}

module "cloud_ecr" {
  source = "../modules/ECR"
}


module "iam_instance_profile" {
  source = "../modules/IAM"
}




# # Output values
# output "aws_subnet_value" {
#   value = module.cloud_network.public_subnet_id  
# }

# output "ec2_aws_iam_instance_profile" {
#   value = module.iam_instance_profile.aws_iam_instance_profile
# }

module "ec2_instance" {
  source = "../modules/EC2"
  aws_ec2_iam_instance_profile = "${module.iam_instance_profile.aws_iam_instance_profile}"
  my_subnet_id = "${module.cloud_network.public_subnet_id[0]}"
  aws_security_group_id = "${module.ec2_instance.aws_security_group_id}"
  aws_vpc_id = "${module.cloud_network.vpc_id}"
}