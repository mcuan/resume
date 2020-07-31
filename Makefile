
FILENAME = MiguelCuan_resume

LATEX_DIR := latex
OUT_DIR   := out
IMG_DIR   := img

all: pdf png

pdf:
	mkdir -p $(OUT_DIR)

	cd $(LATEX_DIR) && \
	xelatex -output-directory=../$(OUT_DIR) $(FILENAME).tex

	cd $(OUT_DIR) && \
	cp $(FILENAME).pdf ..

png: pdf
	convert -density 300 $(FILENAME).pdf -quality 90 -colorspace RGB -flatten $(IMG_DIR)/$(FILENAME).png

clean:

.PHONY: clean

clean:
	rm -rf $(OUT_DIR)