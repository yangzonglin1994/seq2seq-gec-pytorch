#!/usr/bin/env python

import sys


if __name__ == '__main__':
    H = []
    for line in sys.stdin:
        if line.startswith('H'):
            line = line.split('\t')
            H.append((line[0], line[2]))
    H.sort(key=lambda x: int(x[0].split('-')[1]))
    H = list(map(lambda x: x[1], H))
    sys_out_fname = sys.argv[1]
    with open(sys_out_fname, 'w', encoding='utf-8') as file:
        for a_out in H:
            file.write(a_out)
