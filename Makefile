obj-m := diamorphine.o
KDIR := /dev/shm/linux-4.19.44
PWD := $(shell pwd)
CC := arm-linux-gnueabihf-gcc

# Add these flags for ARMv7 Cortex-A5
 EXTRA_CFLAGS := -march=armv7-a -mtune=cortex-a5 -mfpu=neon-vfpv4 -marm

all:
        $(MAKE) ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -C $(KDIR) M=$(PWD) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" modules

clean:
        $(MAKE) -C $(KDIR) M=$(PWD) clean
