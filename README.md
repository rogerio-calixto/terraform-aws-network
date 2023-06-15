# terraform-aws-network
Creates network

# Instruction:

Set the variables below according to your needs:

- project
- region
- subnet_counts     -> this value is used to create subnets for diferents AZ´s and for asg-max and asg-desired

## Example:

- project           -> "tf-network"
- region            -> "us-east-1"
- subnet_counts     -> 4

# outputs

Some key fields about infrastructure created will be returned:

- vpc-id
- avaiable_zones
- private-subnet-ids [] -> list(string)
- public-subnet-ids [] -> list(string)

# TF commands

## Plan
terraform plan -out="tfplan.out"
## Apply
terraform apply "tfplan.out"
## Destroy
terraform destroy -auto-approve
