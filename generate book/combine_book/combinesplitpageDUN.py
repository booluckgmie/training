#=============upload documents================================================#

#pip install PyPDF2

from PyPDF2 import PdfFileMerger
print("\nSet your output filename:")
outputfilename = input()

#set files

#standard template/blank/seperator
blankALL = r".\Standard\2Blank PageNOTHING - 1.pdf"
blank = r".\Standard\4Blank Page - 1.pdf"
isiK = r".\Standard\3.ISIkandungan.pdf"
infog_sep = r".\Standard\6_Infografik.pdf"
indsocial_sep = r".\Standard\8_Indikator Sosial.pdf"
maklumatasas_sep = r".\Standard\10_Sep_Bab1.pdf"
penduduk_sep = r".\Standard\11_Sep_Bab2.pdf"
prumahan_sep = r".\Standard\12_Sep_Bab3.pdf"
gtenaga_sep = r".\Standard\13_Sep_Bab4.pdf"
pendapatanIR_sep = r".\Standard\14_Sep_Bab5.pdf"
pendidikan_sep = r".\Standard\15_Sep_Bab6.pdf"
kesihatan_sep = r".\Standard\16_Sep_Bab7_Kesihatan.pdf"
kemiskinan_sep = r".\Standard\17_Sep_Bab8.pdf"
keselamatan_sep = r".\Standard\18_Sep_Bab9.pdf"
intmediasoc_sep = r".\Standard\19_Sep_Bab10.pdf"
kemudahanasas_sep = r".\Standard\20_Sep_Bab11.pdf"
indecon_sep = r".\Standard\21_Indikator Ekonomi.pdf"
pertubuhan_sep = r".\Standard\22_Sep_Bab12.pdf"
alamat = r".\Standard\23_4.0 alamat century gothic.pdf"
isbn = r".\Standard\4Blank Page - 1.pdf"

#input documents
print("\ncover file:")
cover = input()
print("\nwriteup file:")
subtitle = input()

print("\ninfographic file:")
infog = input()

print("\njadual 1.0-12.1:")
jadual = input()


#=============split document================================================#


from PyPDF2 import PdfFileWriter, PdfFileReader

inputpdf = PdfFileReader(open(jadual, "rb"))

for i in range(inputpdf.numPages):
    output = PdfFileWriter()
    output.addPage(inputpdf.getPage(i))
    with open("jadualsheet_%s.pdf" % int(i+1), "wb") as outputStream:
        output.write(outputStream)
        print(outputStream)


maklumatasas_jadual1 = open(r".\jadualsheet_1.pdf", "rb")
penduduk_jadual20 = open(r".\jadualsheet_2.pdf", "rb")
penduduk_jadual21 = open(r".\jadualsheet_3.pdf", "rb")
prumahan_jadual3 = open(r".\jadualsheet_4.pdf", "rb")
gtenaga_jadual4 = open(r".\jadualsheet_5.pdf", "rb")
pendapatanIR_jadual5 = open(r".\jadualsheet_6.pdf", "rb")
pendidikan_jadual6 = open(r".\jadualsheet_7.pdf", "rb")
kesihatan_jadual7 = open(r".\jadualsheet_8.pdf", "rb")
kemiskinan_jadual80 = open(r".\jadualsheet_9.pdf", "rb")
kemiskinan_jadual81 = open(r".\jadualsheet_10.pdf", "rb")
kemiskinan_jadual82 = open(r".\jadualsheet_11.pdf", "rb")
kemiskinan_jadual83 = open(r".\jadualsheet_12.pdf", "rb")
keselamatan_jadual9 = open(r".\jadualsheet_13.pdf", "rb")
intmediasoc_jadual10 = open(r".\jadualsheet_14.pdf", "rb")
kemudahanasas_jadual11 = open(r".\jadualsheet_15.pdf", "rb")
pertubuhan_jadual120 = open(r".\jadualsheet_16.pdf", "rb")
pertubuhan_jadual121 = open(r".\jadualsheet_17.pdf", "rb")

#=============combine documents================================================#

pdfs = [cover, 
        blankALL, 
        subtitle, #3without isi kandungan
        #harga, 
        #kataP, 
        blank,
        isiK, 
        blank, 
        infog_sep, 
        blank,
        infog, 
        blank,
        indsocial_sep, 
        blank,
        maklumatasas_sep, 
        #blank, 
        maklumatasas_jadual1,
        blank, 
        penduduk_sep, 
        #blank, 
        penduduk_jadual20,
        penduduk_jadual21, 
        #blank, 
        prumahan_sep,
        blank,
        prumahan_jadual3, 
        blank, 
        gtenaga_sep,
        blank,
        gtenaga_jadual4, 
        blank, 
        pendapatanIR_sep,
        blank,
        pendapatanIR_jadual5,
        blank, 
        pendidikan_sep, 
        blank,
        pendidikan_jadual6,
        blank, 
        kesihatan_sep, 
        blank,
        kesihatan_jadual7,
        blank,
        kemiskinan_sep, 
        blank, 
        kemiskinan_jadual80,
        kemiskinan_jadual81,
        kemiskinan_jadual82, 
        kemiskinan_jadual83, 
        keselamatan_sep,
        blank,
        keselamatan_jadual9,
        blank,
        intmediasoc_sep,
        blank,
        intmediasoc_jadual10,
        blank,
        kemudahanasas_sep,
        blank,
        kemudahanasas_jadual11,
        blank,
        indecon_sep,
        blank,
        pertubuhan_sep,
        blank,
        pertubuhan_jadual120,
        pertubuhan_jadual121,
        alamat,
        blankALL,
        isbn]


merger = PdfFileMerger()

for pdf in pdfs:
    merger.append(pdf)

readycombine = "result_"+ outputfilename+".pdf"
merger.write(readycombine)
merger.close()

print("\nOkay, DONE generate "+ readycombine)

print(">>> Set Page Number")


#=============paging================================================#

import io

import pdfrw
from reportlab.pdfgen import canvas
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont

pdfmetrics.registerFont(TTFont('Century-Gothic', 'Century Gothic.ttf'))


def run():
    canvas_data = get_overlay_canvas()
    form = merge(canvas_data, template_path='./'+ readycombine)
    save(form, filename= readycombine)


def get_overlay_canvas() -> io.BytesIO:
    data = io.BytesIO()
    pdf = canvas.Canvas(data)
    pdf.setFont("Century-Gothic", 10)
    pdf.drawString(300,40,"")    #1
    pdf.showPage()
    pdf.drawString(300,40,"")    #2
    pdf.showPage()
    pdf.drawString(300,40,"")    #3
    pdf.showPage()
    pdf.drawString(300,40,"")    #4
    pdf.showPage()
    pdf.drawString(300,40,"")   #5
    pdf.showPage()
    pdf.drawString(300,40,"")    #6
    pdf.showPage()
    pdf.drawString(300,40,"")    #7
    pdf.showPage()
    pdf.drawString(300,40,"")    #8
    pdf.showPage()
    pdf.drawString(300,40,"")   #9
    pdf.showPage()
    pdf.drawString(300,40,"")   #10
    pdf.showPage()
    pdf.drawString(300,40,"")    #11
    pdf.showPage()
    pdf.drawString(300,40,"")    #12
    pdf.showPage()
    pdf.drawString(300,40,"")    #13
    pdf.showPage()
    pdf.drawString(300,40,"")    #14
    pdf.showPage()
    pdf.drawString(300,40,"")   #15
    pdf.showPage()
    pdf.drawString(300,40,"")    #16
    pdf.showPage()
    pdf.drawString(300,40,"3")    #17
    pdf.showPage()
    pdf.drawString(300,40,"")    #18
    pdf.showPage()
    pdf.drawString(300,40,"")   #19
    pdf.showPage()
    pdf.drawString(300,40,"")   #20
    pdf.showPage()
    pdf.drawString(300,40,"5")    #21
    pdf.showPage()
    pdf.drawString(300,40,"6")    #22
    pdf.showPage()
    pdf.drawString(300,40,"")    #23
    pdf.showPage()
    pdf.drawString(300,40,"")    #24
    pdf.showPage()
    pdf.drawString(300,40,"7")   #25
    pdf.showPage()
    pdf.drawString(300,40,"")    #26
    pdf.showPage()
    pdf.drawString(300,40,"")    #27
    pdf.showPage()
    pdf.drawString(300,40,"")    #28
    pdf.showPage()
    pdf.drawString(300,40,"9")   #29
    pdf.showPage()
    pdf.drawString(300,40,"")   #30
    pdf.showPage()
    pdf.drawString(300,40,"")    #31
    pdf.showPage()
    pdf.drawString(300,40,"")    #32
    pdf.showPage()
    pdf.drawString(300,40,"11")    #33
    pdf.showPage()
    pdf.drawString(300,40,"")    #34
    pdf.showPage()
    pdf.drawString(300,40,"")   #35
    pdf.showPage()
    pdf.drawString(300,40,"")    #36
    pdf.showPage()
    pdf.drawString(300,40,"13")    #37
    pdf.showPage()
    pdf.drawString(300,40,"")    #38
    pdf.showPage()
    pdf.drawString(300,40,"")   #39
    pdf.showPage()
    pdf.drawString(300,40,"")   #40
    pdf.showPage()
    pdf.drawString(300,40,"15")    #41
    pdf.showPage()
    pdf.drawString(300,40,"")    #42
    pdf.showPage()
    pdf.drawString(300,40,"")    #43
    pdf.showPage()
    pdf.drawString(300,40,"")    #44
    pdf.showPage()
    pdf.drawString(300,40,"17")   #45
    pdf.showPage()
    pdf.drawString(300,40,"18")    #46
    pdf.showPage()
    pdf.drawString(300,40,"19")    #47
    pdf.showPage()
    pdf.drawString(300,40,"20")    #48
    pdf.showPage()
    pdf.drawString(300,40,"")   #49
    pdf.showPage()
    pdf.drawString(300,40,"")   #50
    pdf.showPage()
    pdf.drawString(300,40,"21")    #51
    pdf.showPage()
    pdf.drawString(300,40,"")    #52
    pdf.showPage()
    pdf.drawString(300,40,"")    #53
    pdf.showPage()
    pdf.drawString(300,40,"")    #54
    pdf.showPage()
    pdf.drawString(300,40,"23")   #55
    pdf.showPage()
    pdf.drawString(300,40,"")    #56
    pdf.showPage()
    pdf.drawString(300,40,"")    #57
    pdf.showPage()
    pdf.drawString(300,40,"")    #58
    pdf.showPage()
    pdf.drawString(300,40,"25")   #59
    pdf.showPage()
    pdf.drawString(300,40,"")   #60
    pdf.showPage()
    pdf.drawString(300,40,"")    #61
    pdf.showPage()
    pdf.drawString(300,40,"")    #62
    pdf.showPage()
    pdf.drawString(300,40,"")    #63
    pdf.showPage()
    pdf.drawString(300,40,"")    #64
    pdf.showPage()
    pdf.drawString(300,40,"27")   #65
    pdf.showPage()
    pdf.drawString(300,40,"28")    #66
    pdf.showPage()
    pdf.drawString(300,40,"")    #67
    pdf.showPage()
    pdf.drawString(300,40,"")    #68
    pdf.showPage()
    pdf.save()
    data.seek(0)
    return data


def merge(overlay_canvas: io.BytesIO, template_path: str) -> io.BytesIO:
    template_pdf = pdfrw.PdfReader(template_path)
    overlay_pdf = pdfrw.PdfReader(overlay_canvas)
    for page, data in zip(template_pdf.pages, overlay_pdf.pages):
        overlay = pdfrw.PageMerge().add(data)[0]
        pdfrw.PageMerge(page).add(overlay).render()
    form = io.BytesIO()
    pdfrw.PdfWriter().write(form, template_pdf)
    form.seek(0)
    return form


def save(form: io.BytesIO, filename: str):
    with open(filename, 'wb') as f:
        f.write(form.read())

if __name__ == '__main__':
    run()
    
    print("\nNice, All ready generated "+ outputfilename + "..check your folder")     