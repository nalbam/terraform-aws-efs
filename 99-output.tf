# output

output "efs_id" {
  value = aws_efs_file_system.this.id
}

output "security_group_id" {
  value = aws_security_group.this.id
}
