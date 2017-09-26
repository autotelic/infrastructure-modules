resource "aws_iam_group" "admin_group" {
  name = "${var.group_name}"
}

resource "aws_iam_group_policy_attachment" "admin_attach" {
  group      = "${aws_iam_group.admin_group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}