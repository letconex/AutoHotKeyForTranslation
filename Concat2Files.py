#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

print("Usage: Concat2Files File1 File2 ConcatenatedFile")
"""
File1 = input("File1: ")
# filenames = [sys.argv[1], sys.argv[2]]
filenames = [sys.argv[1], sys.argv[2]]
with open(sys.argv[3], 'w', encoding='utf-8') as outfile:
    for fname in filenames:
        outfile.write('\n')
        with open(fname, encoding='utf-8') as infile:
                for line in infile:
                    outfile.write(line)
"""
                    
with open(sys.argv[3], 'w', encoding='utf-8') as outfile:
    with open(sys.argv[1], encoding='utf-8') as infile:
            for line in infile:
                outfile.write(line)
outfile.close
with open(sys.argv[3], 'a', encoding='utf-8') as outfile:
    outfile.write('\n')
    with open(sys.argv[2], encoding='utf-8') as infile:
        for line in infile:
            outfile.write(line)           
         
