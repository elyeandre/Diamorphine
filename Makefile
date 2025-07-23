obj-m := diamorphine.o
KDIR := /dev/shm/linux-4.19.44
PWD  := $(shell pwd)
CC   := arm-linux-gnueabihf-gcc

# Extra CFLAGS for ARMv7 Cortex-A5 with NEON/VFPv4 support
EXTRA_CFLAGS := -march=armv7-a -mtune=cortex-a5 -mfpu=neon-vfpv4 -marm

all:
	$(MAKE) -C $(KDIR) ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- M=$(PWD) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
