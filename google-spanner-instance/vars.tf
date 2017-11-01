variable "project_name" {
  description = "The name of the project"
}

variable "number_of_nodes" {
  description = "The number of nodes for the DB instance"
  default     = 1
}

variable "spanner_config_location" {
  description = "location for the spanner instance"
  default     = "us-central1"
}
