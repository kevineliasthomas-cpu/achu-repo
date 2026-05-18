# MongoDB Atlas Terraform Configuration - Example Template
# Copy this file to terraform.tfvars and fill in your actual values
# DO NOT commit terraform.tfvars to version control

organization                 = "your-org-name"
project_name                 = "your-project-name"
project_id                   = "your-org-id"
public_key                   = "your-public-key"
private_key                  = "your-private-key"
db_username                  = "your-db-username"
db_password                  = "your-db-password"
access_list_ip               = "your-ip-address"
cluster_name                 = "your-cluster-name"
provider_name                = "TENANT"
backing_provider_name        = "AZURE"
provider_region_name         = "US_EAST_2"
provider_instance_size_name  = "M0"
mongo_db_major_version       = "8.0"
auto_scaling_disk_gb_enabled = false
