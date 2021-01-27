.venv/bin/python3.7:
	python3.7 -m venv --prompt $(shell basename $(shell pwd)) .venv
	.venv/bin/pip install -U setuptools wheel pip pip-tools
	.venv/bin/pip install twine
	.venv/bin/pip install wheel

sdist:
	.venv/bin/python setup.py sdist bdist_wheel
	.venv/bin/twine check dist/*
	#.venv/bin/twine upload --repository-url https://test.pypi.org/legacy/ dist/*
	.venv/bin/twine upload dist/*
