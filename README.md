# terraform-aws-network
Creates network

# Instruction:

Set the variables below according to your needs:

- region
- project
- subnet_counts     -> this value is used to create subnets for diferents AZ´s and for asg-max and asg-desired

## Example:

- region            -> "us-east-1"
- project           -> "tf-network"
- subnet_counts     -> 4

# outputs

Some key fields about infrastructure created will be returned:

- avaiable_zones
- private-subnet-ids [] -> list(string)
- public-subnet-ids [] -> list(string)
- vpc-id

# TF commands

## Plan
terraform plan -out="tfplan.out"
## Apply
terraform apply "tfplan.out"
## Destroy
terraform destroy -auto-approve
