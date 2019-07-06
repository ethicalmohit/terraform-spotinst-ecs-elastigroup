module "spotinst" {
  source            = "./modules/elastigroup"
  spotinst_account  = "act-9e1cbeb5"
  spotinst_token    = "ba741b8509d525bc09c5e6ca4ea7610686c081a8bbbe3ad6625d1ba748ec7a15"
  ecs_cluster_name  = "testing"
  instance_iam_role = "arn:aws:iam::185704132791:instance-profile/ecsInstanceRole"
}

module "iam-role" {
  source = "./modules/iam"
}
