.PHONY: help

help-logo:
	@echo "\033[34;1m   __ __                  _   ______    _    \033[0m";
	@echo "\033[34;1m  / //_/__ ___  ___ _  __(_)_/_  __/   (_)___\033[0m";
	@echo "\033[34;1m / ,<'/ -_) _ \/ -_) |/ / (_-</ /   _ / / __/\033[0m";
	@echo "\033[34;1m/_/|_|\__/_//_/\__/|___/_/___/_/   (_)_/_/   \033[0m";
	@echo "\033[31;3m__________ ansible playbooks ________________\033[0m";


help: help-logo ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%14s\033[0m : %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


all: infra  ## all playbooks at once

infrastructure:  ## run playbook for building infrastrucure services
	@ansible-playbook -i ./servers/main.yml ./playbook.infrastructure.yml

test:	## test playbook just for check
	@ansible-playbook -i ./servers/main.yml ./playbook.test.yml


ignore-test:	## test playbook just for check
	@ansible-playbook -i ./servers/main.yml ./playbook.infrastructure.yml


.PHONY: source destination clean test
