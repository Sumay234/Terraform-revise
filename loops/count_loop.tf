# This is the loop function and we have created a IAM User here
# This is count-loop

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "creating_iam_user" {
  count = length(var.iam_user_name)
  name = var.iam_user_name[count.index]
}

variable "iam_user_name" {
  description = "IAM User Created"
  type = list(string)
  default = [ "user1", "user2", "user3" ]
}

output "consol_output_iam" {
  value = aws_iam_user.creating_iam_user
}