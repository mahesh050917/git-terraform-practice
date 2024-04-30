variable "rgname" {
  default = "demorg"
}

variable "address_space" {
  type = list(string)
  default= [ "10.0.0.0/16"]
}



