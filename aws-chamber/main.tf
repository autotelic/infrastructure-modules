resource "aws_kms_key" "parameter_store" {
  description             = "Parameter store kms master key"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "parameter_store_alias" {
  name          = "alias/parameter_store_key"
  target_key_id = "${aws_kms_key.parameter_store.id}"
}

resource "aws_iam_group" "chamber_group" {
  name = "${var.group_name}"
}

resource "aws_iam_group_policy_attachment" "chamber_attach" {
  group      = "${aws_iam_group.chamber_group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}