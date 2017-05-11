page_images: manifesto.pdf
	pdftk $^ burst output page-%d.pdf
	sleep 1
	mogrify \
		-background white \
		-alpha Remove \
		+antialias \
		-density 300 \
		-format jpg \
		-resize 1000 \
		-quality 100% \
		-- page-*.pdf

manifesto.pdf:
	curl -o $@ http://documents.manifestos.org.uk/2015/labour.pdf

clean:
	find . ! -name 'Makefile' -type f -exec rm -f {} +

.SECONDARY: manifesto.pdf
.PHONY: page_images
