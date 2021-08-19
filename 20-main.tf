# efs

resource "aws_efs_file_system" "this" {
  creation_token = var.name

  lifecycle_policy {
    transition_to_ia = var.lifecycle_policy
  }

  throughput_mode                 = var.throughput_mode
  provisioned_throughput_in_mibps = var.throughput_mode == "provisioned" ? var.provisioned_throughput_in_mibps : null

  tags = merge(
    var.tags,
    {
      "Name" = var.name
    },
  )
}

resource "aws_security_group" "this" {
  name = var.name

  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.name
    },
  )
}

resource "aws_security_group_rule" "this" {
  count = length(local.security_group_ids)

  description              = "Allow worker to communicate with efs"
  security_group_id        = aws_security_group.this.id
  source_security_group_id = local.security_group_ids[count.index]
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "-1"
  type                     = "ingress"
}

resource "aws_efs_mount_target" "this" {
  count = length(var.subnet_ids)

  file_system_id = aws_efs_file_system.this.id

  subnet_id = var.subnet_ids[count.index]

  security_groups = [aws_security_group.this.id]
}
