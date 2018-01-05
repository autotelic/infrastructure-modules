module "spanne_instance" {
  source       = "github.com/stonevanzuiden/infrastructure-modules//google-spanner-instance"
  project_name = "demo-project"
}

module "spanner_database" {
  source   = "github.com/stonevanzuiden/infrastructure-modules//google-spanner-database"
  instance = "${module.spanner_instance.instance_name}"
  name     = "demo-project"
}
