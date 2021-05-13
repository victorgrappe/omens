#!/bin/sh

. ".env"

pipenv --rm
rm -f Pipfile Pipfile.lock
pipenv install --python "${O_PYTHON_VERSION}"

pipenv install "numpy==${O_PYTHON_NUMPY_VERSION}"
pipenv install "pandas==${O_PYTHON_PANDAS_VERSION}"

pipenv check
pipenv graph
pipenv run python3 --version
cat Pipfile

