# ERF32FG23 Bare Metal

> Use Silicon Labs EFR32 Flex Gecko SoCs without their bloated IDE

## Build

First, make sure that `arm-none-eabi-gcc` is installed and in `$PATH`.

```sh
git submodule update --init
```

```sh
make build
```

## Flash

Make sure `simplicity-commander-cli` is installed.

```sh
make flash
```

