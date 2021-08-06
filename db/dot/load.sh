#!/bin/sh

clear

echo "################################################################"

. "./env/local.env"
echo "${O_S_BP} Environment:"
echo "O_ENV_KEY:      ${O_ENV_KEY}"
echo "O_NEO4J_DB_KEY: ${O_DB_LOC_KEY}"

echo "${O_S_BP} $(cypher-shell --version)"

echo "${O_S_BP} Local DBs:"
ls -l "${O_DB_LOC_ROOT}"

echo "${O_S_BP} Import folder:"
ls -l "${O_DB_LOC_PATH}/import"

echo "----------------------------------------------------------------"

echo "${O_S_BP} Copy dot into import folder"
mkdir "${O_DB_LOC_PATH}/import/dot"
cp "./db/dot/dot.csv" "${O_DB_LOC_PATH}/import/dot"
cat "${O_DB_LOC_PATH}/import/dot/dot.csv"

executeLocalCypher "./db/dot/load.cyp"

echo "################################################################"
