SHELL=/bin/bash
STAGING_DIR ?= ./
DEV_VERSION=dev
DEFAULT_VERSION=2017.2
BUILD_VERSION=${DEV_VERSION}
INDEX=./docs/index.html
HTML="<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"> <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> <head> <meta http-equiv="refresh" content="0; url=/$(DEFAULT_VERSION)"> <title>Docs | VSI</title></head> <body></body></html>"


build: gb_install
	gitbook build . docs/$(BUILD_VERSION)
	$(file >$(INDEX),$(HTML))

gb_install:
	gitbook install

pdf: gb_install
	gitbook pdf ./ ${STAGING_DIR}/vsi_manual.pdf

epub: gb_install
	gitbook epub ./ ${STAGING_DIR}/vsi_manual.epub

all: pdf epub
	echo "Building docs"
