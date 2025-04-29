output "ecs_cluster_name" {
    description = "The Name of the ECS Cluster"
    value = module.ecs.name
}
output "ecs_cluster_id" {
  description = "The ID of the ECS Cluster"
  value       = module.ecs.ecs_cluster_id
}

output "ecs_service_name" {
  description = "The name of the ECS Service"
  value       = module.ecs.ecs_service_name
}

output "task_definition_arn" {
  description = "The ARN of the ECS Task Definition"
  value       = module.ecs.task_definition_arn
}

output "load_balancer_dns_name" {
  description = "The DNS name of the Load Balancer"
  value       = module.ecs.load_balancer_dns_name
}