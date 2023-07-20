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

variable "ssh_keypair_name" {
  type = string
  default = ""
}

variable "ssh_agent_auth" {
  type = bool
  default = false
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

variable "security_groups" {
  type = list(string)
  default = ["default"]
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
  security_groups    = var.security_groups
  ssh_ip_version     = "4"
  ssh_username       = var.ssh_username
  #ssh_keypair_name   = var.ssh_keypair_name
  #ssh_agent_auth     = var.ssh_agent_auth
  insecure           = true
  eip_type           = "5_bgp"
  eip_bandwidth_size = 5
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

#packer {
#  required_plugins {
#    huaweicloud = {
#      version = ">=1.0.3"
#      source  = "github.com/huaweicloud/huaweicloud"
#    }
#  }
#}

