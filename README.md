# xBoot

A very minimalistic x86 bootloader written in assembly (NASM, an ubiquitous flavor of assembly). Don't expect this bootloader to be as robust as a monster like GRUB. This bootloader just boots and displays a typical Hello World style message onto the console.

## Running xBoot

Before you run xBoot install the following dependencies using Homebrew.

```shell
$ brew install nasm
$ brew install qemu
```

If you encounter a problem while installing QEMU, specifically related to the brew link process using the following
command to get rid of the error.

```shell
$ sudo chown -R $(whoami):admin /usr/local/share/man
```

Once done, you can use the help menus to see if they've been installed properly. Now, to run xBoot

```shell
$ cd src
$ chmod +x assemble.sh
$ ./assemble.sh
```

QEMU will open up in a separate window.
