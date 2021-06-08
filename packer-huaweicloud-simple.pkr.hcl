variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
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

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

source "huaweicloud-ecs" "basic-example" {
  auth_url           = var.auth_url
  access_key         = var.access_key
  secret_key         = var.secret_key
  region             = var.region
  flavor             = var.flavor
  image_name         = var.otc_image_name
  source_image_name  = var.source_image_name
  availability_zone  = var.availability_zone
  vpc_id             = var.vpc_id
  subnets            = [var.subnet_id]
  security_groups    = ["default"]
  ssh_ip_version     = "4"
  ssh_username       = "linux"
  insecure           = true
}

build {
  sources = ["source.huaweicloud-ecs.basic-example"]

  provisioner "shell" {
    inline = [
      "echo \"start install nginx, sleep 10s first\"",
      "sleep 10",
      "echo \"run install\"",
      "sudo zypper ref -s",
      "sudo zypper up -y",
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

