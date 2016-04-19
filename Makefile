#Creates & zips word count files
COUNT_SCRIPT = wordcount.py
dats = [isles.dat abyss.dat last.dat]

analysis.zip : isles.dat abyss.dat last.dat $(COUNT_SCRIPT)
	zip $@ $^

.PHONY : dats
dats : isles.dat abyss.dat last.dat

# count words
%.dat : books/%.txt $(COUNT_SCRIPT)
	python wordcount.py $< $*.dat

.PHONY : clean
clean : 
	rm -f *.dat analysis.zip
