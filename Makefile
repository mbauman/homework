PKG:=homework
TEXFLAGS:=-interaction=batchmode
LATEXMKFLAGS:=-pdf -silent

SOURCES:=${PKG}.cls ${PKG}.sty ${PKG}.ins README.txt

all: source doc
doc: ${PKG}.pdf
test: source classtest.pdf
source: ${SOURCES}
archive: source doc ${PKG}.tar.gz

${SOURCES}: ${PKG}.dtx
	tex ${TEXFLAGS} $<

%.pdf: %.tex
	latexmk ${LATEXMKFLAGS} $<
	@touch $@ # latexmk may decide the target is up-to-date without touching it
%.pdf: %.dtx
	latexmk ${LATEXMKFLAGS} $<
	@touch $@

${PKG}.tar.gz:
	ctanify --noauto ${PKG}.{dtx,pdf} ${SOURCES}

clean:
	rm -f *.aux *.blg *.glg *.glo *.gls *.idx *.ilg *.ind *.ist *.log  \
	  *.out *.toc *.fdb_latexmk *.pdfsync *.synctex.gz *.nav *.snm *.vrb 

cleanall: clean
	rm -f *.cls *.sty *.pdf *.txt *.ins *.tar.gz

.PHONY: all doc test source clean cleanall
