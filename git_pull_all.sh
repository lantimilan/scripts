#!/bin/bash
#
# git pull all repository under cwd
#
#
for i in *; do pushd $i; git pull; popd; done
