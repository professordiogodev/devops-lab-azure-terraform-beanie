#!/usr/bin/env bash
# Destroys everything this lab created. Run with: ./teardown.sh
set -u
cd "$(dirname "$0")"
az account show >/dev/null 2>&1 || { echo "Not logged in to Azure (az login)." >&2; exit 1; }
if [ -d terraform/.terraform ]; then
  ( cd terraform && terraform destroy -auto-approve -input=false -var "my_ip_cidr=203.0.113.1/32" ) || echo "terraform destroy reported an error; removing the resource group directly"
fi
az group exists -n rg-beanie-tf | grep -q true && az group delete -n rg-beanie-tf --yes
rm -rf terraform/.terraform terraform/terraform.tfstate* terraform/.terraform.lock.hcl keys
echo "Now run ./verify-teardown.sh"
