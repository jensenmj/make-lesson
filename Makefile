#Creates & zips word count files
COUNT_SCRIPT = wordcount.py
PLOT_SCRIPT = plotcount.py
TXT_FILES = $(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))
PNG_FILES=$(patsubst books/%.txt, %.png, $(TXT_FILES))

analysis.zip : $(DAT_FILES) $(PNG_FILES) $(COUNT_SCRIPT) $(PLOT_SCRIPT)
	zip $@ $^

.PHONY : dats
dats : $(DAT_FILES)

.PHONY : variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)

# count words & plot them
%.dat : books/%.txt $(COUNT_SCRIPT)
	python $(COUNT_SCRIPT) $< $*.dat
	python $(PLOT_SCRIPT) $*.dat $*.png

.PHONY : clean
clean : 
	rm -f $(DAT_FILES) $(PNG_FILES) analysis.zip
