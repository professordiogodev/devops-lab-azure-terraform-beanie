# Submission

Fork URL: <!-- paste the URL of your fork here -->

## Files to commit

- [ ] `terraform/main.tf`: the resource group, network, firewall, public IP and VM
- [ ] `notes.md` with your commands (optional)

## Questions

Answer in your own words. Where a question asks for output, paste it in a code block.

### Q1. Paste `terraform plan` before the first apply (the summary line) and `terraform output`. Which resource did Terraform create first and how did it know the order? Draw two arrows of the dependency graph.

**Your answer:**

<!-- replace this line with your answer -->

### Q2. Map your Terraform resources to the `az` commands you used in the first Azure lab. Which one command became several resources, and which resource has no `az` equivalent you remember?

**Your answer:**

<!-- replace this line with your answer -->

### Q3. The VM size comes from a variable. Why is a size that is restricted in a subscription a problem for IaC and not for a click in the portal? How did you find a size that works?

**Your answer:**

<!-- replace this line with your answer -->

### Q4. Change the SSH rule in the portal (open it to *) and run `terraform plan`. Paste what Terraform wants to do. Then apply. What did you just learn about drift and about who is allowed to change things by hand?

**Your answer:**

<!-- replace this line with your answer -->

### Q5. Run `terraform destroy` then `terraform apply` again and paste the end of both. Is the public IP the same? Does Beanie answer after the rebuild without you touching the VM, and why?

**Your answer:**

<!-- replace this line with your answer -->

### Q6. Where is your Terraform state stored and what is in it that you must never commit (hint: look for the SSH key and the public IP)? Name one problem of local state for a team.

**Your answer:**

<!-- replace this line with your answer -->

### Q7. Paste the output of `./verify.sh`. It must end with **ALL CHECKS PASSED**.

**Your answer:**

<!-- replace this line with your answer -->

### Q8. **Tear down.** Paste the output of `./verify-teardown.sh`. It must end with **TEARDOWN VERIFIED**.

**Your answer:**

<!-- replace this line with your answer -->
