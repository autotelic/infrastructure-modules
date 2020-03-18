variable "bucket_name" {
  description = "Name of the bucket the resources will be stored"
}

variable "environment_tag" {
  description = "Value for the 'Environment' tag"
  default     = "production"
}

variable "origin_id" {
  description = "ID for the bucket origin"
}

variable "price_class" {
  description = "Price class for the cloudfront distribution"
  default     = "PriceClass_100"
}
