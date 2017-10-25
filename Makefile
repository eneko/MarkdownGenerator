.PHONY: docs

docs:
	sourcedocs generate --clean --spm-module MarkdownGenerator --output-folder docs

test:
	swift test --parallel

