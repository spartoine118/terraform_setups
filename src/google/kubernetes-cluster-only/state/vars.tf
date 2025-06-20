variable "STORAGE_NAME" {
  type     = string
  nullable = false
  default  = "terraform-state"
}

variable "ENV" {
  type     = string
  nullable = false
  default  = "dev"
}
