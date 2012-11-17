#!/bin/bash
#
# clean up filename from ilearn

# remove space in filename
for i in *.py; do oldname=$i; mv "$oldname" "${i//\ /}"; done

# rename to username.py
for i in *.py; do mv $i `echo $i | cut -d '_' -f 2`.py; done
