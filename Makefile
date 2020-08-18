SHELL := /bin/bash

# set variables
export NAME = example
export PYTHON = pypy3  # or python3

create:
	$$PYTHON -m venv env

create-install:
	$$PYTHON -m venv env
	source env/bin/activate \
		&& pip3 install -r requirements.txt \
		&& ipython kernel install --user --name=$$NAME

install:
	source env/bin/activate && pip3 install -r requirements.txt

# from https://stackoverflow.com/a/3452888/8930600
upgrade:
	source env/bin/activate && pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

ipython:
	source env/bin/activate && ipython --pdb

jupyter:
	source env/bin/activate && cd analysis && jupyter notebook
