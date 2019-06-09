# terraform-aws-elastigroup

A terraform module containing a common configuration for a spotinst elastigroup  with necessary IAM permissions to access AWS account.

## Assumptions

* You wanted to use spotinst ECS integration with your ECS cluster.
* You wanted to use spotinst ECS autoscaling feature.
* You have already integrated spotinst with your AWS account.
* You have all necessary resources like VPC, subnets, security groups etc. 

## Usage example

```hcl
module "spotinst" {
  source           = "./modules/elastigroup"
  spotinst_account = "<account-id>"
  spotinst_token   = "<token-here>"
}

module "iam-role" {
  source = "./modules/iam"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ecs_cluster_name | ECS cluster name | string | `testing` | yes |
| region | Region name | string | `us-east-1` | yes |
| min_capacity | Region name | string | 0 | yes |
| max_capacity | Region name | string | 5 | yes |
| desired_capacity | Region name | number | 1 | yes |
| instance_types_ondemand | AMI ID | string | `t2.micro` | yes |
| instance_types_preferred_spot | AMI ID | list | `t2.micro` | yes |
| instance_types_spot | AMI ID | list | `t2.micro,t3.micro` | yes |
| fallback_to_ondemand | If enabled, Unavailability of spot will be coved by on-demand. | string | `yes` | yes |
| wait_for_capacity | Minimum number of instances in a 'HEALTHY' status that is required before continuing | number | `us-east-1` | yes |
| wait_for_capacity_timeout | Time (seconds) to wait for instances to report a 'HEALTHY' status. | number | 300 | yes |
