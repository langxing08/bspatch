# CC = arm-none-eabi-gcc
CC = gcc
CFLAGS +=  -O3  -Wall
CLIBS =  


TARGET=bspatch
ROOTSRC=$(wildcard *.c)
ROOTOBJ=$(patsubst %.c, %.o, $(ROOTSRC))
SUBDIR=$(shell ls -d */)
SUBSRC=$(shell find $(SUBDIR) -name '*.c')
SUBOBJ=$(SUBSRC:%.c=%.o)
 
$(TARGET):$(ROOTOBJ) $(SUBOBJ)
	$(CC) $(CFLAGS) $^ -o $@ $(CLIBS)
 
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(TARGET) $(ROOTOBJ) $(SUBOBJ)