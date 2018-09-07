#!/usr/bin/env python

import sys

def get_version(line):
    labels = [x.split('=') for x in line.split()]
    for l in labels:
        if l[0] == 'software.version':
            return l[1].strip('"').strip('\'')
    return False


with open(sys.argv[1]) as f:
    for line in f:
        line = line.rstrip().split()
        if len(line) > 1 and line[0] == 'LABEL':
            print(get_version(' '.join(line[1:])))
