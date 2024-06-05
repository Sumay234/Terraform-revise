# variables.tf

variable "region" {
  description = "The AWS region to create the S3 bucket in."
  type        = string
}

variable "creating_s3" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "acl" {
  description = "The ACL for the S3 bucket."
  type        = string
}

variable "environment" {
  description = "The environment for the S3 bucket (e.g., dev, prod)."
  type        = string
}

variable "versioning" {
  description = "Enable versioning for s3 bucket"
  type = bool
  default = false
}

variable "tags_name" {
  description = "This is to give tags name"
  type = string
}
