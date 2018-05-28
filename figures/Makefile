format := png
dias := $(wildcard dia/*.dia)
imgs := $(dias:.dia=.$(format))

all: $(imgs)

%.$(format): %.dia
	@dia -e $@ -t $(format) $<

.PHONY: clean

clean:
	@rm -f $(imgs)

