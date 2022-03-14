#pip install pikepdf PyPDF2

import os
from pikepdf import Pdf

# a dictionary mapping PDF file to original PDF's page range
file2pages = {
    0: [0, 24], # 1st splitted PDF file will contain the pages from 0 to 9 (9 is not included)
    1: [24, 26], # 2nd splitted PDF file will contain the pages from 9 (9 is included) to 11
    2: [26, 289], # last page+1 until the end or until the 288th page (if exists)
}

# the target PDF document to split
print("\ntarget PDF to split")
filename = input()
print("\nload new jadual")
newjadual = input()

# load the PDF file
pdf = Pdf.open(filename)

# make the new splitted PDF files
new_pdf_files = [ Pdf.new() for i in file2pages ]
# the current pdf file index
new_pdf_index = 0

# iterate over all PDF pages
for n, page in enumerate(pdf.pages):
    if n in list(range(*file2pages[new_pdf_index])):
        # add the `n` page to the `new_pdf_index` file
        new_pdf_files[new_pdf_index].pages.append(page)
        print(f"[*] Assigning Page {n+1} to the file {new_pdf_index}")
    else:
        # make a unique filename based on original file name plus the index
        name, ext = os.path.splitext(filename)
        output_filename = f"__tmp-{new_pdf_index}.pdf"
        # save the PDF file
        new_pdf_files[new_pdf_index].save(output_filename)
        print(f"[+] File: {output_filename} saved.")
        # go to the next file
        new_pdf_index += 1
        # add the `n` page to the `new_pdf_index` file
        new_pdf_files[new_pdf_index].pages.append(page)
        print(f"[*] Assigning Page {n+1} to the file {new_pdf_index}")

# save the last PDF file
name, ext = os.path.splitext(filename)
output_filename = f"__tmp-2.pdf"
new_pdf_files[new_pdf_index].save(output_filename)
print(f"[+] File: {output_filename} saved.")


#================merge

import PyPDF2 

def merge_pdfs(_pdfs):

    mergeFile = PyPDF2.PdfFileMerger()

    for _pdf in _pdfs:

        mergeFile.append(PyPDF2.PdfFileReader(_pdf, 'rb'))
    result_filename = f"resultnew_{filename}"
    mergeFile.write(result_filename)

if __name__ == '__main__':

    _pdfs = ['__tmp-0.pdf', newjadual, '__tmp-2.pdf']

    merge_pdfs(_pdfs)