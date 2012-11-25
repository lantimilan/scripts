#!/bin/bash
if [ -z "$1" ]; then
    echo usage: $0 directory
    exit
fi

src=$1
target="/home/lyan/var/backups/"
outfile=home-$(date +%Y%m%d).tgz
echo $src $target$outfile
tar -cZf $target$outfile $src
