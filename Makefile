STAGING_DIR ?= ./
DEFAULT_VERSION=2017.1

build: gb_install
	gitbook build . docs/$(DEFAULT_VERSION)

gb_install:
	gitbook install

pdf: gb_install
	gitbook pdf ./ ${STAGING_DIR}/vsi_manual.pdf

epub: gb_install
	gitbook epub ./ ${STAGING_DIR}/vsi_manual.epub

all: pdf epub
	echo "Building docs"
