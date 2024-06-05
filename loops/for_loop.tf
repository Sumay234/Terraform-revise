# This is only the for loop


provider "aws" {
  region = "us-east-1"
}

output "print-the-name" {
    value = [for name in var.iam_user_forloop : name]
  
}



variable "iam_user_forloop" {
  description = "IAM User Created"
  type = list(string)
  default = [ "user1", "user2", "user3" ]
}
