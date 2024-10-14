variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
        Component = "frontend"
    }
}

variable "zone_name" {
  default = "pspkdevops.online"
}

# created this variable as part of CD
variable "app_version" {
  type        = string
  default     = ""
  description = "description"
}
