resource "google_spanner_database" "db" {
  instance = "${var.instance_name}"
  name     = "${var.project_name}"
}
