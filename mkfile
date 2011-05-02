<$PLAN9/src/mkhdr

LDFLAGS=-lm
CFLAGS=-Wall -g -std=c99

TARG=starform

OFILES=\
	accrete.$O\
	display.$O\
	elements.$O\
	enviro.$O\
	gensys.$O\
	starform.$O\
	steltype.$O\
	utils.$O

<$PLAN9/src/mkone