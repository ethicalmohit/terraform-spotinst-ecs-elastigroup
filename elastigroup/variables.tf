variable "spotinst_token" {
}

variable "spotinst_account" {
}

variable "ecs_cluster_name" {
  description = "describe your variable"
  default     = ""
}

variable "fallback_to_ondemand" {
  description = "If spot instances are not available then use on-demand instances. (default=true)"
  default     = "true"
}

variable "instance_types_ondemand" {
  default = "t2.micro"
}

variable "instance_types_spot" {
  default = ["t2.micro", "t2.small", "m4.large"]
}

variable "instance_types_preferred_spot" {
  default = ["t2.small"]
}

variable "subnet_ids" {
  description = "List of subnet ids in which the instances will be created."
  default     = ["subnet-0daefb56", "subnet-1759c972"]
}

variable "wait_for_capacity" {
  default = 0
}

variable "wait_for_capacity_timeout" {
  default = 300
}

variable "elastigroup_name" {
  default = "default"
}

variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "String of ami id of the ec2 instances for the ec2 instances."
  default     = "ami-02507631a9f7bc956"
}

variable "min_capacity" {
  default = 0
}

variable "max_capacity" {
  default = 5
}

variable "desired_capacity" {
  default = 1
}

variable "instance_iam_role" {
}

