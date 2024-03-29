.DEFAULT_GOAL := help
help: ## Show this help  
	@grep -E '^[0-9a-zA-Z_-]+[[:blank:]]*:.*?## .*$$' $(MAKEFILE_LIST) | sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[1;32m%-15s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Build the project
	dune build @fmt

.PHONY: test
test: ## Run the tests
	dune runtest

.PHONY: install
install: build ## Install the project
	dune install

.PHONY: clean
clean: ## Clean the project
	dune clean

.PHONY: changelog
changelog: ## Generate changelog
	ghch --format markdown > CHANGELOG.md
