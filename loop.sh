#!/bin/bash
# for loop
for i in $(ls); do
    echo item: $i
done

for i in `seq 1 10`; do
    echo $i
done

for ((i=1; i<=10; ++i)); do
    echo "loop" $i
done

# while loop
counter=0
while [ $counter -lt 10 ]; do
    echo The counter is $counter
    let counter=counter+1
done

# until loop
counter=20
until [ $counter -lt 10 ]; do
    echo counter $counter
    let counter-=1
done
