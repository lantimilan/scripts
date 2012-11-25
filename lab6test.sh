#!/bin/bash
#
# Usage:
# from lab6/ directory
# chmod +x test.sh
# chmod +x lab6 py
# ./test.sh
#pyfile=lab6.py
for pyfile in ../lab6submit/*.py
do
cnt=0
chmod +x $pyfile
for i in "003" "010" "020" "030" "060" "100"
do
    pdir=Mazes
    infile="maze_$i.txt"
    outfile="soln_maze_$i.txt"
    if timeout 1 ./$pyfile <$pdir/$infile >output.txt
    then
        if diff output.txt $pdir/$outfile > /dev/null
        then
            cnt=$(($cnt+1))
        fi
    fi
done
echo `basename $pyfile` $cnt >>lab6grade.txt
done
