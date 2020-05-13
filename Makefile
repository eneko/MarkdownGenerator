.PHONY: docs

docs:
	sourcedocs generate --clean --spm-module MarkdownGenerator --output-folder docs --min-acl public
	sourcedocs package -o docs

test:
	swift test --parallel

