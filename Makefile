all:	starform

# User-tunables: the flags
CFLAGS := $(CFLAGS) -g -std=c99 -DLONG_RAND -Wall -Wextra #-Wundef -Wpointer-arith -Wno-div-by-zero -Wfloat-equal -Wbad-function-cast -Wcast-qual  #-Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wcast-qual -Wwrite-strings -Wconversion -Wsign-compare -Waddress -Waggregate-return -Wold-style-definition -Wmissing-declarations -Wmissing-field-initializers -Wmissing-noreturn -Wmissing-format-attribute -Wpacked -Wredundant-decls -Wnested-externs -Wunreachable-code -Winline -Wvariadic-macros -Wvolatile-register-var -Wpointer-sign -DMOON -Werror
#CFLAGS := -g $(CFLAGS) -std=c99 -DLONG_RAND -Wall -Wextra -DMOON
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
