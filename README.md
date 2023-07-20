# Usage

## Workaround for eu-nl for packer-plugin-huaweicloud 1.0.3

There is a binary for amd64/linux with the integrated fixes attached. Issues are already created:

- https://github.com/huaweicloud/packer-plugin-huaweicloud/issues/95
- https://github.com/huaweicloud/packer-plugin-huaweicloud/issues/94

Copy the `packer-plugin-huaweicloud_v1.0.3_x5.0_fix-nics_linux_amd64` into the local packer plugin 
directory `~/.packer.d/plugins` and delete `~/.packer.d/plugins/github.com/huaweicloud/huaweicloud/packer-plugin-huaweicloud_v1.0.3_x5.0_linux_amd64*`.

## Dependencies

- packer [packer.io](https://www.packer.io/)
- make

## Install huawei plugin

- [github.com/huaweicloud/packer-plugin-huaweicloud](https://github.com/huaweicloud/packer-plugin-huaweicloud)

```shell
$ make init
```

## Validate configuration

```shell
$ make validate
```

## Build image

```shell
$ make build
```

## Debugging

To see the generated output from the Makefile then enter:

```shell
$ make build -n
```
