variable "env" {
  type        = string
  description = "Environment of platform"
  validation {
    condition     = var.env == "dev" || var.env == "qa" || var.env == "ist" || var.env == "uat" || var.env == "prod" || var.env == "dr"
    error_message = "Environment was not specified."
  }
}