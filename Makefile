SHELL=/bin/bash
STAGING_DIR ?= .
DEFAULT_VERSION := 2017.2
BUILD_VERSION := 2017.3
INDEX=./docs/index.html
HTML=<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> <head> <meta http-equiv="refresh" content="0; url=/$(DEFAULT_VERSION)"> <title>Docs | VSI</title></head> <body></body></html>

COMMA = ,
IN_JSON := $(shell cat book.json.in)
ALL_DOCS_LIST := $(subst docs/,,$(shell find docs -mindepth 1 -maxdepth 1 -type d))
ALL_DOCS_LIST += $(DEFAULT_VERSION)
ALL_DOCS_LIST += $(BUILD_VERSION)
SORTED_DOCS_LIST = $(sort $(ALL_DOCS_LIST))
DOCS_JSON_LIST := $(foreach doc_ver,$(SORTED_DOCS_LIST),{"value": "/$(doc_ver)", "text": "$(doc_ver)"$(if $(filter $(DEFAULT_VERSION),$(doc_ver)),$(COMMA)"selected": true)}$(if $(filter-out $(doc_ver),$(lastword $(SORTED_DOCS_LIST))),$(COMMA)))
OUT_JSON := $(subst ___OPTIONS___,$(DOCS_JSON_LIST),$(IN_JSON))

all: build pdf epub
	@echo "Building docs"
	@rm -f book.json

clean:
	rm -f book.json

json:
	$(file >book.json,$(OUT_JSON))

gb_install: json
	gitbook install

html:
	$(file >$(INDEX),$(HTML))

build: gb_install html
	gitbook build . docs/$(BUILD_VERSION)

pdf: gb_install
	gitbook pdf ./ ${STAGING_DIR}/vsi_manual.pdf

epub: gb_install
	gitbook epub ./ ${STAGING_DIR}/vsi_manual.epub
