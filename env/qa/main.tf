module "aws-qa" {
  source = "../../infra"
  type_instance = "t2.micro"
  region_aws = "us-east-1"
  key = "IaC-qa"
}

output "ip" {
  value = module.aws-qa.public_ip
}