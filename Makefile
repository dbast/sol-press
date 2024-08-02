SHELL := /bin/bash -o pipefail -o errexit

pre-commit:
	pre-commit run --all -v

test:
	forge test --gas-report -vvv

lib-update:
	git submodule update --init

lib-update-remote:
	git submodule update --init --remote

lib-reset:
	git submodule foreach --recursive 'git reset --hard && git clean -fdx && git checkout .'

.PHONY: all $(MAKECMDGOALS)
