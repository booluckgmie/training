#=========crop pdf=====================

from PyPDF2 import PdfFileWriter, PdfFileReader

print("input title:")
input_title = input()

print("input document barcode pdf:")
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
pdf_path = output.write(outputStream)
outputStream.close() 
pdf_path = "crop_" + barcode

#=========pdf2image=====================

from pdf2image import convert_from_path
import os

#print("pdf files:")
#pdf_path = input(pdf_path)


pages = convert_from_path(pdf_path, 300)

#Saving pages in PNG format

for page in pages:
    page.save(f'{pdf_path}.png', 'PNG')
    page.save(f'{pdf_path}.png', 'PNG')

pdf_path = f'{pdf_path}.png'

#=========cropimagebarcode=====================

#pip install pillow

from PIL import Image

#print("image file:")
#pdf_path = input()
 
img = Image.open(pdf_path) 
 
left = 90
top = 15
right = 640
bottom = 450

img_res = img.crop((left, top, right, bottom)) 
 
#Saving pages in PNG format

img_res.save('final_'+pdf_path)
insert = 'final_'+pdf_path

#=========generate page with barcode=====================

#pip install PyMuPDF==1.16.14
import fitz

src_pdf_filename = 'BackCoverWObarCode.pdf'
dst_pdf_filename = 'lastcoverWbarcode_'+ input_title +'.pdf'
img_filename = insert

# http://pymupdf.readthedocs.io/en/latest/rect/
# Set position and size according to your needs
img_rect = fitz.Rect(420, 420, 550, 880) #position, position,size, position lower-right

document = fitz.open(src_pdf_filename)

# We'll put image on first page only but you could put it elsewhere
page = document[0]
page.insertImage(img_rect, filename=img_filename)

# See http://pymupdf.readthedocs.io/en/latest/document/#Document.save and
# http://pymupdf.readthedocs.io/en/latest/document/#Document.saveIncr for
# additional parameters, especially if you want to overwrite existing PDF
# instead of writing new PDF
document.save(dst_pdf_filename)

document.close()

print("\nNice, All ready generated last cover with barcode for "+ input_title + "..check your folder")