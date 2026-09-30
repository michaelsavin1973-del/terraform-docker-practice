# Terraform Docker Practice

Run an Nginx container with Terraform using a reusable local module.

## Requirements

- Terraform installed
- Docker running

## Run

Copy the example settings:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` to choose an external port.

Initialize and check the configuration:

```bash
terraform init
terraform validate
terraform plan
```

Create the resources:

```bash
terraform apply
```

Show the website URL:

```bash
terraform output -raw url
```

## Clean up

```bash
terraform destroy
```
