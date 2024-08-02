SHELL := /bin/bash -o pipefail -o errexit

update: forge-update lib-update

forge-install:
	curl -L https://foundry.paradigm.xyz | bash

forge-update:
	forge --version
	foundryup
	forge --version

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
