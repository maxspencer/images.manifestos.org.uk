NUMBERED_PAGES_START = 2

CONVERT_OPTS = \
	-background white \
	-alpha Remove \
	+antialias \
	-density 150 \
	-resize 500 \
	-format jpg \
	-quality 100%

page_images: numbered_page_pdfs cover-page.pdf
	mogrify $(CONVERT_OPTS) -- *page*.pdf

cover-page.pdf: manifesto.pdf
	pdftk $< cat 1 output $@

numbered_page_pdfs: manifesto.pdf
	pdftk $< cat $(NUMBERED_PAGES_START)-end output numbered_pages.pdf
	pdftk numbered_pages.pdf burst output page-%d.pdf
	rm numbered_pages.pdf

manifesto.pdf:
	curl -o $@ http://documents.manifestos.org.uk/2015/labour.pdf

clean:
	find . ! -name 'Makefile' -type f -exec rm -f {} +

.SECONDARY: manifesto.pdf
.PHONY: page_images numbered_page_pdfs
