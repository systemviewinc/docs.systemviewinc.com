STAGING_DIR ?= ./

build:
	gitbook build . docs
	git checkout docs/gitbook/images/

gb_install:
	gitbook install

pdf: gb_install
	gitbook pdf ./ ${STAGING_DIR}/vsi_manual.pdf

epub: gb_install
	gitbook epub ./ ${STAGING_DIR}/vsi_manual.epub

all: pdf epub
	echo "Building docs"