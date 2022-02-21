from pdf2image import convert_from_path

print("pdf files:")
pdf_path = input()
pdf_path = "./"+pdf_path

pages = convert_from_path(pdf_path, 300)

#Saving pages in PNG format

for page in pages:
    page.save(f'{pdf_path}.png', 'PNG')