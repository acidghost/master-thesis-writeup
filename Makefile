main := thesis
viewer := mupdf

.PHONY: FORCE_MAKE figures
all: $(main).pdf

figures:
	$(MAKE) -C figures

%.pdf: %.tex figures FORCE_MAKE
	latexmk -pdf $<

view: $(main).pdf
	@$(viewer) $(main).pdf &

clean:
	@$(MAKE) -C figures clean
	@latexmk -C -silent
	@rm -rf $(main).bbl $(main)-blx.bib $(main).lol $(main).loa $(main).run.xml
