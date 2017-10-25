resource "aws_kms_key" "parameter_store" {
  description             = "Parameter store kms master key"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "parameter_store_alias" {
  name          = "alias/parameter_store_key"
  target_key_id = "${aws_kms_key.parameter_store.id}"
}

data "aws_iam_policy_document" "kms_read_write" {
  statement = {
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt"
    ]
    resources = ["${aws_kms_key.parameter_store.arn}"]
  }
}

resource "aws_iam_policy" "kms_read_write" {
  policy = "${data.aws_iam_policy_document.kms_read_write.json}"
}

data "aws_iam_policy_document" "kms_read_only" {
  statement = {
    effect = "Allow"
    actions = [
      "kms:Decrypt"
    ]
    resources = ["${aws_kms_key.parameter_store.arn}"]
  }
}

resource "aws_iam_policy" "kms_read_only" {
  policy = "${data.aws_iam_policy_document.kms_read_only.json}"
}

resource "aws_iam_group" "chamber_group" {
  name = "${var.group_name}"
}

resource "aws_iam_group_policy_attachment" "chamber_attach_ssm" {
  group      = "${aws_iam_group.chamber_group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_group_policy_attachment" "chamber_attach_kms_read_write" {
  group      = "${aws_iam_group.chamber_group.name}"
  policy_arn = "${aws_iam_policy.kms_read_write.arn}"
}

resource "aws_iam_group" "chamber_group_read_only" {
  name = "SecretsReadOnly"
}

resource "aws_iam_group_policy_attachment" "chamber_attach_ssm_read_only" {
  group      = "${aws_iam_group.chamber_group_read_only.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_group_policy_attachment" "chamber_attach_kms_read_only" {
  group      = "${aws_iam_group.chamber_group_read_only.name}"
  policy_arn = "${aws_iam_policy.kms_read_only.arn}"
}