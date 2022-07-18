resource "aws_ecr_repository" "fastapi" {
  name = "fastapi"
  image_tag_mutability = "MUTABLE"

  tags = {
    project = "fastapi"
  }
}