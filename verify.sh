#!/usr/bin/env bash
# Checks your Terraform, the real resources and the site. Run with: ./verify.sh
cd "$(dirname "$0")" || exit 1
command -v terraform >/dev/null || { echo "Terraform is not installed." >&2; exit 1; }
az account show >/dev/null 2>&1 || { echo "Not logged in to Azure (az login)." >&2; exit 1; }
exec python3 .lab/azcheck.py
