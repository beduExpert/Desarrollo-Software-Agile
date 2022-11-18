variable "region" {
  description = "Location for cloud resources"
}

variable "access_key" {
  description = "Access key to AWS console"
}

variable "secret_key" {
  description = "Secret key to AWS console"
}

variable "ami_id" {
  description = "The AMI to use"
  default     = "ami-09d56f8956ab235b3"
}

variable "instance_type" {
  default = "t2.micro"
}
