variable "accountEmail" {
  nullable = false
  type = string
  default = "" // your email here
}

variable "threshold" {
  nullable = false
  type = number
  default = 1
}