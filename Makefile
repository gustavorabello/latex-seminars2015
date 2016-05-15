# type "make" command in Unix to create asme2e.pdf file 

TEXFILE=main.tex

# REGRAS
PDFFILE=$(TEXFILE:%.tex=%.pdf)

#$(info $(PDFFILE)) # Print variable

all: $(PDFFILE) clean

%.pdf: %.tex
	pdflatex $(@:%.pdf=%.tex)
	makeindex $(basename $@).idx -s StyleInd.ist
	biber $(basename $@)
	pdflatex $(@:%.pdf=%.tex)
	pdflatex $(@:%.pdf=%.tex)

clean:
	@rm -rf *.bcf *.run.xml *ptc *.ps *.log *.dvi *.aux *.out *.*% *.lof *.lop *.lot *.toc *.idx *.ilg *.ind *.bbl *blg

deepclean: clean
	@rm -f $(PDFFILE)
