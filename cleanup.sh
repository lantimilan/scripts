#!/bin/bash

infile=$1
outfile="lab5cp.py"
# comment out all print lines
# remove def slow_cp to end
sed -e 's/print/\#print/' -e '/def slow_cp/,$d' $infile >$outfile

