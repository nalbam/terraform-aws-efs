# terraform-aws-efs

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.30.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.30.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lifecycle\_policy | n/a | `string` | `"AFTER_30_DAYS"` | no |
| name | n/a | `string` | n/a | yes |
| provisioned\_throughput\_in\_mibps | n/a | `number` | `null` | no |
| security\_group\_ids | n/a | `list(string)` | `[]` | no |
| security\_groups | n/a | `list(string)` | `[]` | no |
| subnet\_ids | n/a | `list(string)` | n/a | yes |
| tags | n/a | `map(string)` | `{}` | no |
| throughput\_mode | n/a | `string` | `"bursting"` | no |
| vpc\_id | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| efs\_id | n/a |
| security\_group\_id | n/a |

<!--- END_TF_DOCS --->
