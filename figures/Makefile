format := eps
dias := $(wildcard dia/*.dia)
imgs := $(dias:.dia=.$(format))

all: $(imgs)

%.$(format): %.dia
	@dia -e $@ -t $(format) -L 1- $<

.PHONY: clean

clean:
	@rm -f $(imgs)

