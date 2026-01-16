variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "key_name" {
  type    = string
  default = null
}