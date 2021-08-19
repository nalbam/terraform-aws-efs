# locals

locals {
  security_group_ids = compact(concat(
    var.security_group_ids,
    data.aws_security_group.this.*.id
  ))
}
