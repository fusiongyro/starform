#!/opt/local/bin/zsh

SEED=0x${1%%.run}

if diff $1 <(../starform -s$SEED); then
	echo "yes"
else
	echo "no"
fi
