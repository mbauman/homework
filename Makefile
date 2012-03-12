PKG:=homework

TEXFLAGS:=-interaction=batchmode
LATEXMKFLAGS:=-pdf -silent
INDEXFLAGS:=-q -s gind.ist
GLOSSFLAGS:=-q -s gglo.ist

SOURCES:=${PKG}.cls ${PKG}.sty ${PKG}.ins README.txt

all: source doc
doc: ${PKG}.pdf
test: source classtest.pdf
source: ${SOURCES}
archive: source doc ${PKG}.tar.gz

${SOURCES}: ${PKG}.dtx
	pdftex ${TEXFLAGS} $<

%.pdf: %.tex
	latexmk ${LATEXMKFLAGS} $<

%.pdf: %.dtx
	pdflatex ${TEXFLAGS} $<
	makeindex ${INDEXFLAGS} -o $*.ind $*.idx
	makeindex ${GLOSSFLAGS} -o $*.gls $*.glo
	pdflatex ${TEXFLAGS} $<
	pdflatex ${TEXFLAGS} $<

${PKG}.tar.gz:
	ctanify --noauto ${PKG}.{dtx,pdf} ${SOURCES}

clean:
	rm -f *.cls *.sty *.pdf *.txt *.ins *.tar.gz
	rm -f *.aux *.blg *.glg *.glo *.gls *.hd *.idx *.ilg *.ind *.ist *.log  \
      *.out *.toc *.fdb_latexmk *.pdfsync *.synctex.gz *.nav *.snm *.vrb

.PHONY: all doc test source clean
