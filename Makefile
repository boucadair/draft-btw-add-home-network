SOURCE_DOCS := $(wildcard *.xml)

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.xml=.txt) \
 $(SOURCE_DOCS:.xml=.html) 


RM=/bin/rm -f
XML2RFC=xml2rfc


%.txt : %.xml
	$(XML2RFC) --v3 --text --html $<
# we make both text and html variants at once, because it's faster than calling xml2rfc to build each separately

%.html : %.xml
	$(XML2RFC) --v3 --html $<

# Targets and dependencies

.PHONY: all clean 

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(EXPORTED_DOCS) 

