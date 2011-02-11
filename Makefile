PKGNAME:=homework

all: ${PKGNAME}.cls ${PKGNAME}.sty ${PKGNAME}.pdf
doc: ${PKGNAME}.pdf
${PKGNAME}: ${PKGNAME}.cls ${PKGNAME}.sty
.PHONY: all doc ${PKGNAME}


${PKGNAME}.cls:
	tex ${PKGNAME}.ins

${PKGNAME}.sty:
	tex ${PKGNAME}.ins

${PKGNAME}.pdf:
	pdflatex ${PKGNAME}.dtx

clean:
	rm -f *.cls *.sty
	rm -f *.aux *.bbl *.blg *.glg *.glo *.gls *.idx *.ilg *.ind *.ist *.log \
      *.out *.toc *.fdb_latexmk *.pdfsync *.synctex.gz *.nav *.snm *.vrb 
