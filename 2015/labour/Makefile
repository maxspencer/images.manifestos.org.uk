page_images: numbered_page_images cover-page.jpg

cover-page.jpg: manifesto.pdf
	pdftk $< cat 1 output $@

numbered_page_images: numbered_pages.pdf
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

numbered_pages.pdf: manifesto.pdf
	pdftk $< cat 2-end output $@

manifesto.pdf:
	curl -o $@ http://documents.manifestos.org.uk/2015/labour.pdf

clean:
	find . ! -name 'Makefile' -type f -exec rm -f {} +

.SECONDARY: manifesto.pdf
.PHONY: page_images numbered_page_images
