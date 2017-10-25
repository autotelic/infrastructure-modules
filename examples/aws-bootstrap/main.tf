module "admin_group" {
  source = "github.com/stonevanzuiden/infrastructure-modules//aws-admin-group"
}

module "state_bucket" {
  source = "github.com/stonevanzuiden/infrastructure-modules//terraform-remote-state-s3-bucket"
  bucket_name = "test-terraform-state"
}

module "state_lock" {
  source = "github.com/stonevanzuiden/infrastructure-modules//terraform-remote-state-lock-table"
  table_name = "test-terraform-state"
}

module "chamber" {
  source = "github.com/stonevanzuiden/infrastructure-modules//aws-chamber"
  group_name = "SecretKeepers"
}