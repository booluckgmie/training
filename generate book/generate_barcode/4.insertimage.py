#=========generate page with barcode=====================
#pip install PyMuPDF

pdf_path = input()
print("input title:")
input_title = input()

import PyPDF2

input_file = pdf_path
output_file = input_title+"-with-barcode"+".pdf"
watermark_file = ".\Standard\4 Back cover without barCode.pdf"

with open(input_file, "rb") as filehandle_input:
    # read content of the original file
    pdf = PyPDF2.PdfFileReader(filehandle_input)
    
    with open(watermark_file, "rb") as filehandle_watermark:
        # read content of the watermark
        watermark = PyPDF2.PdfFileReader(filehandle_watermark)
        
        # get first page of the original PDF
        first_page = pdf.getPage(0)
        
        # get first page of the watermark PDF
        first_page_watermark = watermark.getPage(0)
        
        # merge the two pages
        first_page.mergePage(first_page_watermark)
        
        # create a pdf writer object for the output file
        pdf_writer = PyPDF2.PdfFileWriter()
        
        # add page
        pdf_writer.addPage(first_page)
        
        with open(output_file, "wb") as filehandle_output:
            # write the watermarked file to the new file
            pdf_writer.write(filehandle_output)