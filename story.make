default:
	make pretty
	make pdf

$(STORY).html: $(STORY)
	outliner <$(STORY) >$(STORY).html
	wordcount <$(STORY)

pdf: $(STORY).html
	novel_to_latex <$(STORY).html | short_story_ms >$(STORY).tex
	cp ../story.cls . && pdflatex $(STORY) && pdflatex $(STORY)
	make tidy
	wordcount <$(STORY)

# single-spaced, with various other tweaks to make more fit on one page, 
# reduces page count by roughly 4:1
ss: $(STORY).html
	make pretty
	novel_to_latex <$(STORY).html | short_story_ms -sp >$(STORY).tex
	cp ../ss.cls ./story.cls && pdflatex $(STORY) && pdflatex $(STORY)
	make tidy
	wordcount <$(STORY)

rtf: $(STORY).html
	novel_to_latex <$(STORY).html | rtf_ms >$(STORY).rtf

$(STORY).txt: $(STORY)
	outliner <$(STORY) >$(STORY).html && critters <$(STORY).html >$(STORY).txt
	wordcount <$(STORY)

txt: $(STORY).txt
	#

oww: $(STORY).txt
	txt_to_oww <$(STORY).txt >$(STORY).oww

pretty:
	@# remove multiple spaces:
	@perl -e 'local $$/; $$t=<>; $$t=~s/ {2,}/ /g; print $$t' <$(STORY) >temp && mv $(STORY) a.a && mv temp $(STORY)
	@reparagraph $(STORY)
	@wordcount <$(STORY)
	@rm -f a.a

word:
	wordcount <$(STORY)

spell:
	ispell $(STORY)

tidy:
	rm -f $(STORY).log $(STORY).aux story.cls

clean:
	rm -f $(STORY).tex $(STORY).html $(STORY).pdf $(STORY).critters *~ a.a $(STORY).aux $(STORY).log $(STORY).toc $(STORY).rtf $(STORY).oww $(STORY).bak story.cls grid.tex grid.pdf grid.aux grid.log

post: $(STORY).html
	fiction_html_to_public <$(STORY).html >~/Lightandmatter/fiction/$(STORY).html

grid: $(STORY).grid
	do_grid <$(STORY).grid >grid.tex
	pdflatex grid
	rm -f grid.tex
