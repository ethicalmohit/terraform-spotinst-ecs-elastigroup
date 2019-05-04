# Create an Elastigroup
resource "spotinst_elastigroup_aws" "ecs-elastigroup" {
  name        = "default-elastigroup"
  description = "created by Terraform"
  product     = "Linux/UNIX"

  max_size         = 2
  min_size         = 0
  desired_capacity = 1
  capacity_unit    = "instance"

  region   = "us-east-1"
  image_id = "ami-0be9e1908fe51a590"

  #iam_instance_profile = "iam-profile"
  #key_name             = "my-key.ssh"
  security_groups = ["sg-3330774f"]
  spot_percentage = 100

  user_data         = "IyEvYmluL2Jhc2gKZWNobyBFQ1NfQ0xVU1RFUj10ZXN0aW5nLWNsdXN0ZXIgPj4gL2V0Yy9lY3MvZWNzLmNvbmZpZztlY2hvIEVDU19CQUNLRU5EX0hPU1Q9ID4+IC9ldGMvZWNzL2Vjcy5jb25maWc7"
  enable_monitoring = true
  ebs_optimized     = false
  placement_tenancy = "default"

  instance_types_ondemand       = "t2.micro"
  "instance_types_spot" = ["t2.micro", "t3.micro", "t3a.micro"]
  instance_types_preferred_spot = ["t2.micro"]

  instance_types_ondemand = "t2.micro"

  subnet_ids = ["subnet-0daefb56", "subnet-1759c972", "subnet-1196c83c", "subnet-ba8b84f3", "subnet-c470c8c8", "subnet-5921b665"]

  # instance_types_weights = [
  #   {
  #     instance_type = "t2.micro"
  #     weight        = 10
  #   },
  #   {
  #     instance_type = "t3.micro"
  #     weight        = 16
  #   },
  # ]

  orientation          = "balanced"
  fallback_to_ondemand = true
  cpu_credits          = "unlimited"

  wait_for_capacity         = 0
  wait_for_capacity_timeout = 300

  scaling_strategy = {
    terminate_at_end_of_billing_hour = true
    termination_policy               = "default"
  }

  "health_check_type" = "ECS_CLUSTER_INSTANCE"

  "health_check_grace_period" = 300

  "health_check_unhealthy_duration_before_replacement" = 120

  integration_ecs = {
    cluster_name         = "testing-cluster"
    autoscale_is_enabled = true

    # autoscale_cooldown                     = 300
    # autoscale_scale_down_non_service_tasks = false

    # autoscale_headroom = {
    #   cpu_per_unit    = 1024
    #   memory_per_unit = 512
    #   num_of_units    = 2
    # }

    # autoscale_down = {
    #   evaluation_periods        = 300
    #   max_scale_down_percentage = 70
    # }

    # autoscale_attributes = [{
    #   key   = "test.ecs.key"
    #   value = "test.ecs.value"
    # }]
  }

   "region" = "us-east-1"

  tags = [
    {
      key   = "Env"
      value = "TESTING"
    },
    {
      key   = "Name"
      value = "default-testing"
    },
    {
      key   = "Project"
      value = "Testing"
    },
  ]

  lifecycle {
    ignore_changes = [
      "desired_capacity",
    ]
  }
}
