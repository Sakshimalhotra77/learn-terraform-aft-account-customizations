resource "aws_ssm_parameter" "foo" {
  name  = "foo-local-dec-18"
  type  = "String"
  value = "bar"
}