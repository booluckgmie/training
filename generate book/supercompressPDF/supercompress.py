from __future__ import print_function
import os
import subprocess

print("DIR:\n")
path = input()

for root, dirs, files in os.walk(path):
    for file in files:
        if file.endswith(".pdf"):
            filename = os.path.join(root, file)
            print (filename)
            arg1= '-sOutputFile=' + "web_" +  file #added a web_ to the filename
            p = subprocess.Popen(['C:/Program Files/gs/gs9.56.0/bin/gswin64c.exe', #ghostscript exe file
                                  '-sDEVICE=pdfwrite', 
                                  '-dCompatibilityLevel=1.4', 
                                  '-dPDFSETTINGS=/default', '-dFastWebView','-dNOPAUSE', 
                                  '-dBATCH', str(arg1), filename], #'-dQUIET',
                                 stdout=subprocess.PIPE)
            #print (p.communicate())