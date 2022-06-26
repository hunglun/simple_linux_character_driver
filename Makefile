KDIR ?= /lib/modules/$(shell uname -r)/build
# To make this module for WSL2 linux kernel,
# make KDIR=${HOME}/WSL2-Linux-Kernel
# See README.md for WSL linux kernel build details.

obj-m :=simple_char_driver.o


all:
	make -C $(KDIR) M=$(PWD) modules 
	gcc simple_char_test.c -o simple_char_test

clean:
	make -C $(KDIR) M=$(PWD) clean
