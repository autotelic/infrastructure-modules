resource "aws_dynamodb_table" "lock_table" {

  name           = "${var.table_name}"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}

output "locak_table_arn" {
  value = "${aws_dynamodb_table.lock_table.arn}""
}