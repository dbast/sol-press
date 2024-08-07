SHELL := /bin/bash -o pipefail -o errexit

# renovate datasource=github-releases depName=foundry-rs/foundry
FOUNDRY_VERSION ?= nightly-f2518c92c8743777a4941a91e4eb56dd3a96ff0f

update: forge-update lib-update

forge-install:
	curl -L -o install.sh "https://raw.githubusercontent.com/foundry-rs/foundry/$(FOUNDRY_VERSION:nightly-%=%)/foundryup/install"
	echo "6d493a985e0c8c666a9d6ded4c662d2db530d91ea2679dd941fd4b2820fab023 install.sh" | sha256sum --check --status
	bash install.sh
	rm install.sh

forge-update:
	forge --version
	foundryup --version "${FOUNDRY_VERSION}"
	forge --version

pre-commit:
	pre-commit run --all -v

test:
	forge test --gas-report --show-progress -vvv

coverage:
	forge coverage --gas-report --show-progress -vvv

lib-update:
	git submodule update --init

lib-reset:
	git submodule foreach --recursive 'git reset --hard && git clean -fdx && git checkout .'

.PHONY: all $(MAKECMDGOALS)
