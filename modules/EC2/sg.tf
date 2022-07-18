# module "db_sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "db_sg"
#   description = "Security group for db_sg"
#   vpc_id      = data.aws_vpc.default.id

#   ingress_with_source_security_group_id = [
#     {
#       description              = "db access"
#       rule                     = "postgresql-tcp"
#       source_security_group_id = module.ec2_sg.this_security_group_id
#     }
#   ]
#   egress_rules = ["all-all"]
# }

resource "aws_security_group" "ec2_sg" {
    name = "ec2_Security_group"
    description = "Secirity Group for Ec2 instance"
    vpc_id      = "${var.aws_vpc_id}"

    # For running uvicorn - Port 8000
    ingress {
        description = "port 8000"
        from_port = 8000
        protocol = "tcp"
        self = false
        to_port = 8000
        cidr_blocks = ["0.0.0.0/0"]
    }

    # For SSH - Port 22
    ingress {
        description = "port 22"
        from_port = 22
        protocol = "tcp"
        self = false
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allowing all for outbound calls
    egress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        project = "hello-world",
        Owner = "Interview"
    }
    
}