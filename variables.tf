variable "aws_vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = list(string)
  default     = "10.0.1.0/24"
  
}
variable "availability_zone" {
  type        = string
  default     = "us-east-1"
  
}

variable "ssh_key"{
    type        = string
    default     = ""
}
variable "tfstate_bucket"{
    type        = string
}