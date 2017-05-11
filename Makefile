all:
	$(MAKE) -C 2015
	$(MAKE) -C 2017

deploy:
	aws --profile manifestos.org.uk s3 sync . s3://images.manifestos.org.uk --delete --exclude '*Makefile' --exclude '*~' --exclude '*.pdf' --exclude '*.txt'
