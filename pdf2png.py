#!/usr/bin/env python
# multiple1902 <multiple1902@gmail.com>
# Released under MIT License
#
# pdf2png.py:
#   Convers a PDF file to a set of PNG's
#
# Usage:
#   pdf2png.py PDF_File [Density]
#
# Note: 
#   Density defaults to 100


import sys, os

if len(sys.argv)<=1:
    print "need an argument indicating the PDF file to be converted"
    sys.exit(-1)

pdffilename=sys.argv[1]
pngfilename=pdffilename[:-4]
density=100
if len(sys.argv)==3:
    density=sys.argv[2]

def makenum(x):
    t=str(x)
    while(len(t)<3):
        t="0%s" % t
    return t

i=0

while os.system("convert -density %s %s[%s] %s-%s.png > /dev/null 2>&1" % (density, pdffilename, i, pngfilename, makenum(i+1)))==0:
    print "generated %s-%s.png" % (pngfilename, makenum(i+1))
    i=i+1

print "finished converting with %s slides" % (str(i))

