CONFIG_MODULE_SIG=n

ifneq ($(KERNELRELEASE),)
obj-m := tcp_cubic.o

# Otherwise we were called directly from the command
# line; invoke the kernel build system.
else
KDIR := /lib/modules/$(shell uname -r)/build
PWD:=$(shell pwd)
all:
	make -C $(KDIR) M=$(PWD) modules
clean:
	rm -f *.ko *.o *.symvers *.cmd *.cmd.o *.mod.c *.order
endif
