from PyPDF2 import PdfFileWriter, PdfFileReader

print("input pdf:")
barcode = input()
output = PdfFileWriter() 
input = PdfFileReader(open(barcode, 'rb')) 

n = input.getNumPages()

for i in range(n):
  page = input.getPage(i)
  page.cropBox.upperLeft = (15,1100)
  page.cropBox.lowerRight = (160,740)
  output.addPage(page) 
  
outputStream = open("crop_" + barcode,'wb') 
output.write(outputStream)
outputStream.close() 