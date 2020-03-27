# CC = arm-none-eabi-gcc
CC = gcc
CFLAGS += -O3
CLIBS =  

INCLUDE = $(wildcard ./*.h ./bzip2/*.h)
SOURCES = $(wildcard ./*.c ./bzip2/*.c)
# SOURCES = bspatch_main.c bspatch.c exfile.c extents.c $(wildcard ./bzip2/*.c)
INCLUDE_DIRS = -I./bzip2


TARGET = bspatch
OBJECTS = $(patsubst %.c,%.o,$(SOURCES))

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@ $(CLIBS)

  $(OBJECTS): %.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@ $(INCLUDE_DIRS)


.PHONY: clean
clean:
	rm -f *.o ./bzip2/*.o $(TARGET)
