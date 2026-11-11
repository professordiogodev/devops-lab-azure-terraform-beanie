#!/usr/bin/env bash
rc=0
ls terraform/*.tf >/dev/null 2>&1 && echo "- ✅ terraform/ has .tf files" || { echo "- ❌ no .tf files"; rc=1; }
grep -q 'azurerm_linux_virtual_machine' terraform/main.tf && echo "- ✅ the VM is in main.tf" || { echo "- ❌ no azurerm_linux_virtual_machine in terraform/main.tf"; rc=1; }
git ls-files | grep -qE '\.tfstate|\.terraform/|\.tfvars$|^keys/' && { echo "- ❌ state, .terraform/, tfvars or keys is committed"; rc=1; } || echo "- ✅ no state, tfvars or keys committed"
grep -qE '^ALL CHECKS PASSED \(' SUBMISSION.md && echo "- ✅ SUBMISSION.md shows ALL CHECKS PASSED" || { echo "- ❌ paste the verify.sh output ('ALL CHECKS PASSED') into SUBMISSION.md"; rc=1; }
exit $rc
