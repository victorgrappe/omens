#!/bin/sh

. ".env"

echo "################################################################"
echo "LANG : ${LANG}"
echo "LC_ALL : ${LC_ALL}"
echo "LC_CTYPE : ${LC_CTYPE}"
echo "O_PYTHON_VERSION : ${O_PYTHON_VERSION}"
echo "O_PYTHON_NUMPY_VERSION : ${O_PYTHON_NUMPY_VERSION}"
echo "O_PYTHON_PANDAS_VERSION : ${O_PYTHON_PANDAS_VERSION}"

pipenv install

echo "----------------------------------------------------------------"
pipenv run python3 main.py
echo "################################################################"
