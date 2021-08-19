# variable

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "name" {
  type = string
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "lifecycle_policy" {
  type    = string
  default = "AFTER_30_DAYS"
}

variable "throughput_mode" {
  type    = string
  default = "bursting"
}

variable "provisioned_throughput_in_mibps" {
  type    = number
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
