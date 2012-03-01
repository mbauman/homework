PKGNAME:=homework
TEXFLAGS:=-interaction=batchmode
LATEXMKFLAGS:=-pdf -silent

all: ${PKGNAME} doc
doc: ${PKGNAME}.pdf
test: classtest.pdf
${PKGNAME}: ${PKGNAME}.cls ${PKGNAME}.sty

${PKGNAME}.cls: ${PKGNAME}.dtx | ${PKGNAME}.ins
	rm -f ${PKGNAME}.cls ${PKGNAME}.sty
	tex ${TEXFLAGS} ${PKGNAME}.ins

${PKGNAME}.sty: ${PKGNAME}.dtx | ${PKGNAME}.ins
	rm -f ${PKGNAME}.cls ${PKGNAME}.sty
	tex ${TEXFLAGS} ${PKGNAME}.ins

%.pdf: %.tex
${PKGNAME}.pdf: %.pdf : %.dtx %.cls %.ins
%.pdf:
	latexmk ${LATEXMKFLAGS} $<
	@touch ${PKGNAME}.pdf

clean:
	rm -f *.cls *.sty *.pdf
	rm -f *.aux *.bbl *.blg *.glg *.glo *.gls *.idx *.ilg *.ind *.ist *.log \
      *.out *.toc *.fdb_latexmk *.pdfsync *.synctex.gz *.nav *.snm *.vrb 

.PHONY: all doc ${PKGNAME} clean test