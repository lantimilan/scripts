#!/bin/bash
HELLO=hello
function hello {
    local HELLO=world
    echo $HELLO
}
echo $HELLO
hello  # calls function hello
echo $HELLO
