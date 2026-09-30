#!/usr/bin/env bash
set -e

echo "Checking Terraform formatting..."
terraform fmt -check -recursive

echo "Validating Terraform configuration..."
terraform validate

echo "All Terraform checks passed!"
