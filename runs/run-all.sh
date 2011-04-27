#!/bin/sh

for file in *.run; do 
	./compare.sh $file
done