resource "github_team" "github_organization_team" {
  name        = "${var.team_name}"
  description = "${var.team_description}"
  privacy     = "${var.team_privacy}"
}