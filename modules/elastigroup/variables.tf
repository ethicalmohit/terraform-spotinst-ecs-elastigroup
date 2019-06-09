variable "spotinst_token" {
  description = "describe your variable"
  default     = "default value"
}

variable "spotinst_account" {
  description = "describe your variable"
  default     = "default value"
}

variable "ecs_cluster_name" {
  description = "describe your variable"
  default     = "testing"
}

variable "fallback_to_ondemand" {
  description = "If spot instances are not available then use on-demand instances. (default=true)"
  default = "true"
}

variable "instance_types_ondemand" {
  default = "t2.micro"
}
variable "instance_types_spot" {
  default = ["t2.micro", "t3.micro", "t3a.micro"]
}
variable "instance_types_preferred_spot" {
  default = ["t2.micro"]
}

variable "subnet_ids" {
  default = ["subnet-0daefb56", "subnet-1759c972", "subnet-1196c83c", "subnet-ba8b84f3", "subnet-c470c8c8", "subnet-5921b665"]
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
  default = "ami-0be9e1908fe51a590"
}
