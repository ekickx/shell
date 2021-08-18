BASE := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
MKDIR = mkdir -p
LN = ln -snfv

.PHONY: list
list:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

env_var:
	$(LN) $(BASE)/profile $(HOME)/.profile
	$(LN) $(HOME)/.profile $(HOME)/.bash_profile
	$(LN) $(HOME)/.profile $(HOME)/.zshenv

git:
	$(LN) $(BASE)/gitconfig $(HOME)/.gitconfig

npm:
	$(LN) $(BASE)/npmrc $(HOME)/.npmrc

zsh:
	$(LN) $(BASE)/zshrc.d $(HOME)/.zshrc.d
	$(LN) $(BASE)/zshrc $(HOME)/.zshrc
