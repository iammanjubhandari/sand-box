variable "aws_region" {
  description = "Sydney Region"
  type        = string
  default     = "ap-southeast-2a"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0df609f69029c9bdb" # Amazon2 Linux AMI ID
}
