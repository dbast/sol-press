SHELL := /bin/bash -o pipefail -o errexit

pre-commit:
	pre-commit run --all -v

test:
	forge test --gas-report -vvv

update-lib:
	git submodule update --init --remote

.PHONY: all $(MAKECMDGOALS)
