// variables
variable "virginia_cidr" {
  description = "CIDR Virginia"
  type        = string
  sensitive   = false
}

variable "public_subnet_public_ip" {
  type = bool
}

variable "subnets" {
  description = "subnets list"
  type        = list(string)
}

variable "tags" {
  type = map(string)
}

variable "ec2_ami" {
  type = string
}

variable "sg_ingress_cidr" {
  description = "cidr for ingress traffic"
  type        = string
}

variable "instances" {
  description = "instance names"
  type        = list(string)
}

variable "monitoring" {
  description = "enabling instance deployment monitoring"
  type        = bool
}

variable "access_key" {}

variable "secret_key" {}
