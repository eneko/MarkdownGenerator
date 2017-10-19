.PHONY: docs

docs:
	rm -rf Docs/Reference/MarkdownGenerator
	sourcedocs --spm-module MarkdownGenerator

