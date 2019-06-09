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