#!/bin/bash
cd /notexist &>/dev/null
echo return_value: $?
cd $(pwd) &>/dev/null
echo return_value: $?
