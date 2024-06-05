# This is for-each loop

provider "aws" {
  region = "us-east-1"
}


resource "aws_iam_user" "iam_created_for-each-loop" {
  for_each = var.iam_user_created-for-each-loop
  name = each.value
}

variable "iam_user_created-for-each-loop" {
  description = "This is to created IAM USER by for each loop"
  type = set(string)
  default = ["user-A", "user-B", "user-C"]
}