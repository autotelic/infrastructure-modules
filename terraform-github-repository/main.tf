resource "github_repository" "repository" {
  name        = "${var.repo_name}"
  description = "${var.repo_description}"
}
