terraform {
  required_version = ">= 1.5.0"

  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.21"
    }
  }
}

#####################################################
# MongoDB Atlas Provider
#####################################################

provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}

#####################################################
# Existing Atlas Project
#####################################################

data "mongodbatlas_project" "existing_project" {
  project_id = var.project_id
}

#####################################################
# Atlas Cluster
#####################################################

resource "mongodbatlas_cluster" "cluster" {
  project_id = data.mongodbatlas_project.existing_project.id
  name       = var.cluster_name

  provider_name               = var.provider_name
  backing_provider_name       = var.backing_provider_name
  provider_region_name        = var.provider_region_name
  provider_instance_size_name = var.provider_instance_size_name

  mongo_db_major_version       = var.mongo_db_major_version
  auto_scaling_disk_gb_enabled = var.auto_scaling_disk_gb_enabled
}

#####################################################
# Database User
#####################################################

resource "mongodbatlas_database_user" "db_user" {
  username           = var.db_username
  password           = var.db_password
  project_id         = data.mongodbatlas_project.existing_project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}

#####################################################
# Project IP Access List
#####################################################

resource "mongodbatlas_project_ip_access_list" "ip_access" {
  project_id = data.mongodbatlas_project.existing_project.id
  ip_address = var.access_list_ip
  comment    = "Terraform Managed IP"
}

#####################################################
# Outputs
#####################################################

output "cluster_name" {
  value = mongodbatlas_cluster.cluster.name
}

output "mongodb_srv_connection_string" {
  value     = mongodbatlas_cluster.cluster.connection_strings[0].standard_srv
  sensitive = true
}