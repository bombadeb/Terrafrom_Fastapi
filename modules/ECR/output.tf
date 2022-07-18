output "fastapi_ecr_registry_id" {
    value = "aws_ecr_repository.fastapi.registry_id"
    description = "fastapi_ecr_registry_id"
}

output "fastapi_ecr_repository_url" {
    value = "aws_ecr_repository.fastapi.repository_url"
    description = "fastapi_ecr_repository_url"
}