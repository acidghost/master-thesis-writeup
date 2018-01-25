MAIN := thesis
VIEWER := mupdf

.PHONY: FORCE_MAKE
all: $(MAIN).pdf

%.pdf: %.tex FORCE_MAKE
	latexmk -pdf $<

view: $(MAIN).pdf
	@$(VIEWER) $(MAIN).pdf &

clean:
	@latexmk -C -silent
	@rm -rf $(MAIN).bbl $(MAIN)-blx.bib $(MAIN).lol $(MAIN).run.xml
