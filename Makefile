all:	starform

# User-tunables: the flags
CFLAGS := $(CFLAGS) -std=c99 -DLONG_RAND -Wall -Wextra #-Wno-div-by-zero -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wcast-qual -Wwrite-strings -Wconversion -Wsign-compare -Waddress -Waggregate-return -Wold-style-definition -Wmissing-declarations -Wmissing-field-initializers -Wmissing-noreturn -Wmissing-format-attribute -Wpacked -Wredundant-decls -Wnested-externs -Wunreachable-code -Winline -Wvariadic-macros -Wvolatile-register-var -Wpointer-sign -DMOON -Werror
#CFLAGS := -g $(CFLAGS) -std=c99 -DLONG_RAND -Wall -Wextra -DMOON
LDFLAGS := -g -lm

# Our sources. If you add one, add it here.
SOURCES := accrete.c data.c display.c enviro.c gensys.c propert.c starform.c \
           steltype.c utils.c

OBJECTS := ${SOURCES:.c=.o}

.depend: $(wildcard *.c *.h)
	$(CC) -MM -E *.c *.h > $@

include .depend

starform: $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f *.o starform
