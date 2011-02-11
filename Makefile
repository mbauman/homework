PKGNAME:=homework
TEXFLAGS:=-interaction=batchmode
LATEXMKFLAGS:=-pdf -silent

all: ${PKGNAME}.cls ${PKGNAME}.sty ${PKGNAME}.pdf
doc: ${PKGNAME}.cls ${PKGNAME}.pdf
${PKGNAME}: ${PKGNAME}.cls ${PKGNAME}.sty

${PKGNAME}.cls: ${PKGNAME}.dtx ${PKGNAME}.ins
	tex ${TEXFLAGS} ${PKGNAME}.ins

${PKGNAME}.sty: ${PKGNAME}.dtx ${PKGNAME}.ins
	tex ${TEXFLAGS} ${PKGNAME}.ins

${PKGNAME}.pdf: ${PKGNAME}.dtx ${PKGNAME}.ins
	latexmk ${LATEXMKFLAGS} ${PKGNAME}.dtx

clean:
	rm -f *.cls *.sty *.pdf
	rm -f *.aux *.bbl *.blg *.glg *.glo *.gls *.idx *.ilg *.ind *.ist *.log \
      *.out *.toc *.fdb_latexmk *.pdfsync *.synctex.gz *.nav *.snm *.vrb 

.PHONY: all doc ${PKGNAME} clean
