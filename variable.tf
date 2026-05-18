variable "organization" {
  description = "Organization name"
  type        = string
}

variable "project_name" {
  description = "MongoDB Atlas project name"
  type        = string
}

variable "project_id" {
  description = "Organization ID (or existing project org_id)"
  type        = string
}

variable "public_key" {
  description = "MongoDB Atlas public API key"
  type        = string
  sensitive   = true
}

variable "private_key" {
  description = "MongoDB Atlas private API key"
  type        = string
  sensitive   = true
}

variable "db_username" {
  description = "Database user name"
  type        = string
  default     = "USERNAME"
}

variable "db_password" {
  description = "Database user password"
  type        = string
  sensitive   = true
  default     = "PASSWORD"
}

variable "access_list_ip" {
  description = "IP address to add to project access list"
  type        = string
  default     = "IP_ADDRESS"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "atlasClusterName"
}

variable "provider_name" {
  description = "Provider name"
  type        = string
  default     = "TENANT"
}

variable "backing_provider_name" {
  description = "Backing provider (AWS/AZURE/GCP)"
  type        = string
  default     = "AWS"
}

variable "provider_region_name" {
  description = "Provider region"
  type        = string
  default     = "providerRegionName"
}

variable "provider_instance_size_name" {
  description = "Instance size"
  type        = string
  default     = "M2"
}

variable "mongo_db_major_version" {
  description = "MongoDB major version"
  type        = string
  default     = "4.4"
}

variable "auto_scaling_disk_gb_enabled" {
  description = "Auto-scaling disk enabled"
  type        = string
  default     = "false"
}
