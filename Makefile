readme.html : readme.md
	cmark "$<" > "$@"

.PHONY: pip-install
pip-install: requirements.txt
	./.venv/bin/python -m pip install -r requirements.txt
	# ./.venv/bin/python -m pip install jupyter numpy scipy matplotlib pandas basemap

.PHONY: pip-freeze
pip-freeze:
	./.venv/bin/python -m pip freeze > requirements.txt

.PHONY: recreate-venv
recreate-venv: requirements.txt
	python3 -m venv .venv
	./.venv/bin/python -m pip install -r requirements.txt

.PHONY: jupyter-notebook
jupyter-notebook:
	./.venv/bin/jupyter-notebook
