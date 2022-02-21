#pip install pillow

from PIL import Image

print("image file:")
pdf_path = input()
 
img = Image.open(pdf_path) 
 
left = 90
top = 15
right = 640
bottom = 450

img_res = img.crop((left, top, right, bottom)) 
 
#Saving pages in PNG format

img_res.save('crop'+pdf_path)
