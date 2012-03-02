PKGNAME:=homework
TEXFLAGS:=-interaction=batchmode
LATEXMKFLAGS:=-pdf -silent

SOURCES:=${PKGNAME}.cls ${PKGNAME}.sty README.txt

all: source doc
doc: ${PKGNAME}.pdf
test: source classtest.pdf

source: ${SOURCES}
${SOURCES}: ${PKGNAME}.dtx
	tex ${TEXFLAGS} $<
	@touch $@

%.pdf: %.tex
${PKGNAME}.pdf: %.pdf : %.dtx
%.pdf:
	latexmk ${LATEXMKFLAGS} $<
	@touch ${PKGNAME}.pdf # latexmk may decide it's up-to-date w/o touching it

clean:
	rm -f *.cls *.sty *.pdf *.txt
	rm -f *.aux *.bbl *.blg *.glg *.glo *.gls *.idx *.ilg *.ind *.ins *.ist \
	  *.log *.out *.toc *.fdb_latexmk *.pdfsync *.synctex.gz *.nav *.snm *.vrb 

.PHONY: all doc test source clean
