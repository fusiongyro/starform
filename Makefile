all:	starform

# User-tunables: the flags
CFLAGS := $(CFLAGS) -g -std=c99 -DLONG_RAND -Wall -Wextra
LDFLAGS := -g -lm

# Our sources. If you add one, add it here.
SOURCES := $(wildcard *.c)

OBJECTS := ${SOURCES:.c=.o}

.depend: $(wildcard *.c *.h)
	$(CC) -MM -E *.c *.h > $@

include .depend

starform: $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f *.o starform
