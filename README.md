# Usage

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
