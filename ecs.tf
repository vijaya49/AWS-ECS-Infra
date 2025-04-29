module "ecs" {
  source          = "git::https://github.com/vijaya49/Terraform-Modules.git//ecs?ref=main"

  app_name        = "prod-ecs"
  container_port  = 80
  image_tag       = var.image_tag
  domain_name     = "production.cloudvj.in"
  vpc_id          = "vpc-0f67aaef49b800c43"
  public_subnet_ids      = ["subnet-0f640e4b87bc6bee5", "subnet-0af195a3b64176b82"]
  private_subnet_ids      = ["subnet-06d703c919fa37976", "subnet-06b62a8e43cc8704e"]
}