#!/bin/bash

pyfile="lab5test.py"
for i in ../lab5submit/*.py
do
    ./cleanup.sh $i >lab5cp.py
    echo -n `basename $i` ' '
    ./$pyfile
done


