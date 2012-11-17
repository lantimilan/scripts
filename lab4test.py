#!/usr/bin/python
from cs141 import *
a = [(1<<32)-1, 1<<64, 1<<100]
b = [1<<15, 1<<200, 1<<345]

for x,y in zip(a,b):
    x1 = LargeInt(x)
    y1 = LargeInt(y)
    assert x1.multiply(y1).to_int() == x*y
