# Create an Elastigroup
resource "spotinst_elastigroup_aws" "default-elastigroup" {

  name        = "default-elastigroup"
  description = "created by Terraform"
  product     = "Linux/UNIX"

  max_size          = 0
  min_size          = 0
  desired_capacity  = 0
  capacity_unit     = "weight"

  region      = "us-west-2"
  subnet_ids  = ["sb-123456", "sb-456789"]

  image_id              = "ami-a27d8fda"
  iam_instance_profile  = "iam-profile"
  key_name              = "my-key.ssh"
  security_groups       = ["sg-123456"]
  user_data             = "echo hello world"
  enable_monitoring     = false
  ebs_optimized         = false
  placement_tenancy     = "default"

  instance_types_ondemand       = "m3.2xlarge"
  instance_types_spot           = ["m3.xlarge", "m3.2xlarge"]
  instance_types_preferred_spot = ["m3.xlarge"]

  instance_types_weights = [
  {
    instance_type = "c3.large"
    weight        = 10
  },
  {
    instance_type = "c4.xlarge"
    weight        = 16
  }]

  orientation           = "balanced"
  fallback_to_ondemand  = false
  cpu_credits           = "unlimited"

  wait_for_capacity         = 5
  wait_for_capacity_timeout = 300

  scaling_strategy = {
    terminate_at_end_of_billing_hour = true
    termination_policy = "default"
  }

  scaling_up_policy = {
    policy_name        = "Default Scaling Up Policy"
    metric_name        = "DefaultQueuesDepth"
    statistic          = "average"
    unit               = "none"
    adjustment         = 1
    namespace          = "custom"
    threshold          = 100
    period             = 60
    evaluation_periods = 5
    cooldown           = 300
  }

  scaling_down_policy = {
    policy_name        = "Default Scaling Down Policy"
    metric_name        = "DefaultQueuesDepth"
    statistic          = "average"
    unit               = "none"
    adjustment         = 1
    namespace          = "custom"
    threshold          = 10
    period             = 60
    evaluation_periods = 10
    cooldown           = 300
  }

  tags = [
  {
     key   = "Env"
     value = "production"
  }, 
  {
     key   = "Name"
     value = "default-production"
  },
  {
     key   = "Project"
     value = "app_v2"
  }
 ]

  lifecycle {
    ignore_changes = [
      "desired_capacity",
    ]
  }
}
