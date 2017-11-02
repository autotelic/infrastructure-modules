module "spanne_instance" {
  source       = "github.com/stonevanzuiden/infrastructure-modules//google-spanner-instance"
  project_name = "demo-project"
}

module "name" {
  source   = "github.com/stonevanzuiden/infrastructure-modules//google-spanner-database"
  instance = "${module.spanner_instance.instance_name}"
  name     = "demo-project"
}
