# Create an Elastigroup
resource "spotinst_elastigroup_aws" "ecs-elastigroup" {
  name        = "default-elastigroup"
  description = "created by Terraform"
  product     = "Linux/UNIX"

  max_size         = 0
  min_size         = 0
  desired_capacity = 0
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
  instance_types_ondemand       = "t2.micro"
  instance_types_spot           = ["t2.micro", "t3.micro", "t3a.micro"]
  instance_types_preferred_spot = ["t2.micro"]
  instance_types_ondemand = "t2.micro"
  subnet_ids = ["subnet-0daefb56", "subnet-1759c972", "subnet-1196c83c", "subnet-ba8b84f3", "subnet-c470c8c8", "subnet-5921b665"]
  # Valid values: "balanced", "costOriented", "equalAzDistribution", "availabilityOriented".
  orientation = "balanced"
  # Parameter to spawn on-demand instance, incase spot is not available.
  fallback_to_ondemand = true
  # Parameter for t3 type instances
  cpu_credits = "unlimited"
  #Minimum number of instances in a 'HEALTHY' status that is required before continuing. 
  wait_for_capacity = 0
  # Time (seconds) to wait for instances to report a 'HEALTHY' status.
  wait_for_capacity_timeout = 300

  # scaling_strategy = {
  #   terminate_at_end_of_billing_hour = true
  #   termination_policy               = "default"
  # }


  #########################
  # Custom Health Checks for ECS Instance (Optional)
  #########################

  health_check_type                                  = "ECS_CLUSTER_INSTANCE"
  health_check_grace_period                          = 300
  health_check_unhealthy_duration_before_replacement = 120

  ########################
  # Spotinst ECS Integration
  ########################

  integration_ecs = {
    cluster_name         = "testing-cluster"
    autoscale_is_enabled = true

    ######################
    # Custom(Optional) Parameters to plug-in with spotinst ECS Autoscaling.
    ######################

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
