#Creates & zips word count files

analysis.zip : isles.dat abyss.dat last.dat
	zip $@ $^

.PHONY : dats
dats : isles.dat abyss.dat last.dat

# count words
isles.dat : books/isles.txt wordcount.py
	python wordcount.py $< $@
	
abyss.dat : books/abyss.txt wordcount.py
	python wordcount.py $< $@

last.dat : books/last.txt wordcount.py
	python wordcount.py $< $@

	

.PHONY : clean
clean : 
	rm -f *.dat analysis.zip
