#####################################################
# MongoDB Atlas API Keys
#####################################################

variable "public_key" {
  description = "MongoDB Atlas Public API Key"
  type        = string
  sensitive   = true
}

variable "private_key" {
  description = "MongoDB Atlas Private API Key"
  type        = string
  sensitive   = true
}

#####################################################
# Existing MongoDB Atlas Project
#####################################################

variable "project_id" {
  description = "Existing MongoDB Atlas Project ID"
  type        = string
}

#####################################################
# Cluster Configuration
#####################################################

variable "cluster_name" {
  description = "MongoDB Atlas Cluster Name"
  type        = string
  default     = "atlas-cluster"
}

variable "provider_name" {
  description = "Provider Type"
  type        = string
  default     = "TENANT"
}

variable "backing_provider_name" {
  description = "Cloud Provider (AWS, AZURE, GCP)"
  type        = string
  default     = "AZURE"
}

variable "provider_region_name" {
  description = "Cloud Provider Region"
  type        = string
  default     = "US_EAST_2"
}

variable "provider_instance_size_name" {
  description = "Cluster Instance Size"
  type        = string
  default     = "M0"
}

variable "mongo_db_major_version" {
  description = "MongoDB Major Version"
  type        = string
  default     = "7.0"
}

variable "auto_scaling_disk_gb_enabled" {
  description = "Enable Disk Auto Scaling"
  type        = bool
  default     = false
}

#####################################################
# Database User Configuration
#####################################################

variable "db_username" {
  description = "Database Username"
  type        = string
}

variable "db_password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}

#####################################################
# IP Access List
#####################################################

variable "access_list_ip" {
  description = "IP Address Allowed to Access MongoDB Atlas"
  type        = string
}