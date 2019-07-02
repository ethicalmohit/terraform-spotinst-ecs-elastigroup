module "spotinst" {
  source            = "./modules/elastigroup"
  spotinst_account  = "your-account-id"
  spotinst_token    = "your-secret-id"
  ecs_cluster_name  = "testing"
  instance_iam_role = "arn:aws:iam::999999999999:instance-profile/ecsInstanceRole"
}

module "iam-role" {
  source = "./modules/iam"
}
