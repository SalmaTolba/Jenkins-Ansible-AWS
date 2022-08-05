variable "region" {
  type = string
}
variable "ec2_instance_type" {
  type = string
}
variable "cidr_vpc" {
  type = string
}

variable "first_public" {
  type = string
}


variable "second_public" {
  type = string
}

variable "first_private" {
  type = string
}

variable "second_private" {
  type = string
}
# ############db variables
# variable "engine_db" {
#   type = string
# }
# variable "engine_version_db" {
#   type = string
# }
# variable "name_db" {
#   type = string
# }
# variable "username_db" {
#   type = string
# }
# variable "password_db" {
#   type = string
# }
# variable "parameter_group_name_db" {
#   type = string
# }
# variable "node_type_db" {
#   type = string
# }