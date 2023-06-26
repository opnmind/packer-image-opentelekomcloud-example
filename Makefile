.PHONY: build, validate, fmt, init

PKRVARS=packer-huaweicloud.pkrvars.hcl
PKR=packer-huaweicloud-simple.pkr.hcl
SECUREVARS=secret.pkrvars.hcl

build:
	HW_DEBUG=1 PACKER_LOG=1 packer build -var-file=$(PKRVARS) -var-file=$(SECUREVARS) $(PKR)

validate:
	PACKER_LOG=1 packer validate -var-file=$(PKRVARS) -var-file=$(SECUREVARS) $(PKR)

fmt:
	PACKER_LOG=1 packer fmt -check -var-file=$(PKRVARS) -var-file=$(SECUREVARS) $(PKR)

init:
	PACKER_LOG=1 packer init -var-file=$(PKRVARS) -var-file=$(SECUREVARS) $(PKR)
