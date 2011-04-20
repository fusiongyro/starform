all:	starform

# User-tunables: the flags
CFLAGS := -std=c99 -DLONG_RAND -Wall -DMOON
LDFLAGS := -lm -lcompat

# Our sources. If you add one, add it here.
SOURCES := accrete.c data.c display.c enviro.c gensys.c propert.c starform.c \
           steltype.c utils.c

OBJECTS := ${SOURCES:.c=.o}

.depend: $(wildcard *.c *.h)
	gcc -MM -E *.c *.h > $@

include .depend

starform: $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f *.o starform
