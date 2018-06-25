variable "admin_user_arn" {
  description = "user arn for static asset write permissions"
}

variable "bucket_name" {
  description = "name of bucket"
}

variable "bucket_region" {
  description = "region of bucket"
  default     = "us-west-2"
}

variable "prefix" {
  description = "object key prefix identifying one or more objects to which the old age lifecycle rule applies"
  default     = "assets/"
}

variable "time_to_live" {
  description = "days until items with old age tag expire"
  default     = 5
}
