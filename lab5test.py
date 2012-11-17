#!/usr/bin/env python2.7

import threading
class TimeoutError(Exception): pass

def timelimit(timeout):
    def internal(function):
        def internal2(*args, **kw):
            class Calculator(threading.Thread):
                def __init__(self):
                    threading.Thread.__init__(self)
                    self.result = None
                    self.error = None
                
                def run(self):
                    try:
                        self.result = function(*args, **kw)
                    except:
                        self.error = sys.exc_info()[0]
            
            c = Calculator()
            c.start()
            c.join(timeout)
            if c.isAlive():
                raise TimeoutError
            if c.error:
                raise c.error
            return c.result
        return internal2
    return internal

from lab5cp_soln import *

@timelimit(3)
def run_test(infile, soln):
    f = open(infile)
    pts = []
    for line in f.readlines():
        x = float(line.split()[0])
        y = float(line.split()[1])
        pts.append((x,y))
    EPS = 1.0e-6
    d1 = closest_pair(pts)
    d2 = soln
    diff = abs(d1-d2)
    #print infile, d1, d2
    assert (diff < EPS) or (diff/max(d1,d2) < EPS)

# main here
infile = ["input_10.txt", "input_100.txt", "input_10e5.txt", "input_3.txt"]
soln = [2.86356421266, 9.91036114377, 0.0785875308176, 2.2360679775]
cnt = 0
for i in range(len(infile)):
    try:
        run_test(infile[i], soln[i])
        cnt += 1
    except:
        pass
print cnt
