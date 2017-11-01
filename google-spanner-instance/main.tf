resource "google_spanner_instance" "main" {
  config       = "${var.spanner_config_location}"
  display_name = "${var.project_name}"
  name         = "${var.project_name}"
  num_nodes    = "${var.number_of_nodes}"
}
