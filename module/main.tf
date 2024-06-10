provider "aws" {
    region = "us-east-1"
  
}

module "sumay-webserver-1" {
  source = ".//module-1"
}

module "sumay-webserver-2" {
  source = ".//module-2"
}