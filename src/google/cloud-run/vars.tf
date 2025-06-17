
variable "REGION" {
  type      = string
  nullable  = false
  default   = "europe-west6"
  sensitive = true
}

variable "PROJECT_ID" {
  type      = string
  nullable  = false
  sensitive = true
}
