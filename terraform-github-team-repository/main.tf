resource "github_team_repository" "team-repository" {
  team_id    = "${var.team_id}"
  repository = "${var.repo_name}"
  permission = "${var.permission}"
}