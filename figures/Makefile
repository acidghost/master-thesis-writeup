format := eps
dias := $(wildcard dia/*.dia)
imgs := $(dias:.dia=.$(format))

pdfs := $(wildcard pdftocrop/*.pdf)
croppeddir := cropped
croppedpdfs := $(patsubst pdftocrop/%,$(croppeddir)/%,$(pdfs))

all: $(imgs) $(croppedpdfs)

%.$(format): %.dia
	@dia -e $@ -t $(format) -L 1- $<

$(croppeddir)/%.pdf: pdftocrop/%.pdf
	@pdfcrop $< $@

$(croppedpdfs): | cropoutdir

cropoutdir:
	@mkdir -p $(croppeddir)

test:
	@echo $(croppedpdfs) $(imgs)

.PHONY: clean cropoutdir test

clean:
	@rm -rf $(imgs) $(croppeddir)

