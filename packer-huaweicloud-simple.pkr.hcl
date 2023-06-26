variable "access_key" {
  type = string
  sensitive = true
}

variable "secret_key" {
  type = string
  sensitive = true
}

variable "ssh_username" {
  type = string
  default = "linux"
}

variable "project_name" {
  type = string
  default = "eu-de"
}

variable "auth_url" {
  type = string
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "region" {
  type = string
  default = "eu-de"
}

variable "flavor" {
  type = string
  default = "s3.medium.2"
}

variable "otc_image_name" {
  type = string
  default = "packer-image"
}

variable "source_image_name" {
  type = string
  default = "Standard_CentOS_8_latest"
}

variable "availability_zone" {
  type = string
  default = "eu-de-01"
}

variable "vpcid" {
  type = string
}

variable "subnets" {
  type = string
}

source "huaweicloud-ecs" "basic-example" {
  auth_url           = var.auth_url
  access_key         = var.access_key
  secret_key         = var.secret_key
  project_name       = var.project_name
  region             = var.region
  flavor             = var.flavor
  image_name         = var.otc_image_name
  source_image_name  = var.source_image_name
  availability_zone  = var.availability_zone
  vpc_id              = var.vpcid
  subnets            = [var.subnets]
  security_groups    = ["default"]
  ssh_ip_version     = "4"
  ssh_username       = var.ssh_username
  insecure           = true
}

build {
  sources = ["source.huaweicloud-ecs.basic-example"]

  provisioner "shell" {
    inline = [
      "echo \"start install, sleep 10s first\"",
      "sleep 10",
      "echo \"run install\"",
      "sudo apt update -y",
      "sudo apt upgrade -y",
      "echo \"upgrade done\""
    ]
  }
}

packer {
  required_plugins {
    huaweicloud = {
      version = ">= 0.4.0"
      source  = "github.com/huaweicloud/huaweicloud"
    }
  }
}

