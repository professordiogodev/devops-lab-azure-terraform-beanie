# PROVIDED.
variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "subscription_id" {
  description = "Azure subscription id (./setup.sh writes it to terraform.tfvars, which is not committed)"
  type        = string
}

variable "my_ip_cidr" {
  description = "Your public IP as a /32 (./setup.sh writes it to terraform.tfvars)"
  type        = string

  validation {
    condition     = can(cidrhost(var.my_ip_cidr, 0)) && endswith(var.my_ip_cidr, "/32")
    error_message = "my_ip_cidr must be a single address in CIDR form, for example 203.0.113.7/32."
  }
}

variable "vm_size" {
  description = "VM size. Standard_B1ms is the cheapest but is restricted in some subscriptions: then try Standard_D2s_v3."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "public_key_path" {
  description = "Public half of the lab SSH key created by ./setup.sh"
  type        = string
  default     = "../keys/id_ed25519.pub"
}
