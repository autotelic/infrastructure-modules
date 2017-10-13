variable "url" {
  description = "The url the webhook emits to"
}

variable "content_type" {
  description = "The content type being emitted from the webhook"
}

variable "insecure_ssl" {
  description = "encryption of the webhook emitted event"
  default     = "true"
}

variable "active" {
  description = "The name of the webhook"
}

variable "events" {
  description = "The events the webhook will listen to"
  type        = "list"
}