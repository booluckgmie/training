#pip install PyPDF2

from PyPDF2 import PdfFileReader, PdfFileWriter

print("input filename:")
path = input()

from PyPDF2 import PdfFileWriter, PdfFileReader

inputpdf = PdfFileReader(open(path, "rb"))

for i in range(inputpdf.numPages):
    output = PdfFileWriter()
    output.addPage(inputpdf.getPage(i))
    with open("jadualsheet_%s.pdf" % int(i+1), "wb") as outputStream:
        output.write(outputStream)
        print(outputStream)
        
     