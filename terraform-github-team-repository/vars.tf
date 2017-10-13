variable "team_id" {
  description = "The id of the team"
}
variable "repo_name" {
  description = "The name of the repository"
}
variable "permission" {
  description = "The permission levels for the team members"
  default     = "push"
}