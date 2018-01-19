MAIN := main

.PHONY: FORCE_MAKE
all: $(MAIN).pdf

%.pdf: %.tex FORCE_MAKE
	latexmk -pdf $<

clean:
	@latexmk -C -silent
	@rm -rf $(MAIN).bbl $(MAIN)-blx.bib $(MAIN).lol $(MAIN).run.xml
