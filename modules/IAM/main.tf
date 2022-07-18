resource "aws_iam_role" "test_role" {
  name = "test_role"
  assume_role_policy  = "${file("../modules/IAM/ec2-assume-policy.json")}"
}

resource "aws_iam_role_policy" "test_policy" {
  name                = "test_policy"
  role                = aws_iam_role.test_role.id

  policy              = "${file("../modules/IAM/ec2-policy.json")}"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = "${aws_iam_role.test_role.name}"
}
