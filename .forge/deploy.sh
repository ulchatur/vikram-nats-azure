#!/bin/bash

# REQUIRES: azure, terraform

set -e

echo "Starting Nats server app on Azure infrastructure deployment..."

# Terraform commands inside infra directory
terraform -chdir=infra init
terraform -chdir=infra plan -out=tfplan
terraform -chdir=infra apply -auto-approve tfplan

echo "Infrastructure deployed successfully."