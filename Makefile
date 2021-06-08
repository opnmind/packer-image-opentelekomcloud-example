.PHONY: build, validate, fmt, init

PKRVARS=packer-huaweicloud.pkrvars.hcl
PKR=packer-huaweicloud-simple.pkr.hcl

build:
	HW_DEBUG=1 PACKER_LOG=1 packer build -var-file=$(PKRVARS) $(PKR)

validate:
	PACKER_LOG=1 packer validate -var-file=$(PKRVARS) $(PKR)

fmt:
	PACKER_LOG=1 packer fmt -check -var-file=$(PKRVARS) $(PKR)

init:
	PACKER_LOG=1 packer init -var-file=$(PKRVARS) $(PKR)
