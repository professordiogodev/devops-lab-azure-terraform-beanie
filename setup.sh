#!/usr/bin/env bash
# Checks your tools and your Azure login, creates an SSH key, writes terraform/terraform.tfvars. Creates nothing in Azure.
set -u
cd "$(dirname "$0")"
bad=0
for c in az terraform ssh-keygen curl python3; do command -v "$c" >/dev/null || { echo "MISSING: $c"; bad=1; }; done
[ "$bad" = 0 ] || { echo "Install what is missing and run ./setup.sh again."; exit 1; }
az account show >/dev/null 2>&1 || { echo "Not logged in to Azure. Run: az login"; exit 1; }
mkdir -p keys
[ -f keys/id_ed25519 ] || ssh-keygen -q -t ed25519 -N '' -C azure-tf-lab -f keys/id_ed25519
chmod 600 keys/id_ed25519
IP=$(curl -fsS https://checkip.amazonaws.com | tr -d '[:space:]')
SUB=$(az account show --query id -o tsv)
printf 'subscription_id = "%s"\nmy_ip_cidr      = "%s/32"\n' "$SUB" "$IP" > terraform/terraform.tfvars
cat <<TXT
Ready.
  Subscription:  $(az account show --query name -o tsv)
  Your IP:       $IP   (in terraform/terraform.tfvars, not committed; update it if your IP changes)
  SSH key:       keys/id_ed25519
Nothing exists in Azure yet.
TXT
