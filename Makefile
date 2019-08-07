main := thesis
pres := presentation
viewer := mupdf

.PHONY: FORCE_MAKE figures
all: $(main).pdf $(pres).pdf

figures:
	$(MAKE) -C figures

$(pres).pdf: tikz-uml.sty

%.pdf: %.tex figures FORCE_MAKE
	latexmk -pdf $<

view: $(main).pdf
	@$(viewer) $(main).pdf &

tikz-uml.sty:
	wget https://perso.ensta-paristech.fr/~kielbasi/tikzuml/var/files/src/tikzuml-v1.0-2016-03-29.tbz
	tar -xjf tikzuml-v1.0-2016-03-29.tbz
	mv tikzuml-v1.0-2016-03-29/tikz-uml.sty ./tikz-uml.sty
	rm -rf tikzuml-v1.0-2016-03-29.tbz tikzuml-v1.0-2016-03-29

present: $(pres).pdf
	@$(viewer) $(pres).pdf &

clean:
	@$(MAKE) -C figures clean
	@latexmk -C -silent
	@rm -rf $(main).bbl $(main)-blx.bib $(main).lol $(main).loa $(main).run.xml
