#!/bin/bash

goodfile='good.txt'
badfile='bad.txt'
logfile='log.txt'
pyfile='cs141.py'
testfile='lab4test.py'
if [ -f $goodfile ]; then rm $goodfile; fi
if [ -f $badfile ]; then rm $badfile; fi
if [ -f $logfile ]; then rm $logfile; fi

for i in *.py
do
    echo check $i >>$logfile
    sed 's/^maxbits.*/maxbits=0/g' $i >$pyfile
    if ./$testfile >/dev/null 2>>$logfile
    then echo $i >>$goodfile
    else echo $i >>$badfile
    fi
    sleep 1  # wait for previous command to flush
done
