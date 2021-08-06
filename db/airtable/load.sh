#!/bin/sh

clear

echo "################################################################"
. "./env/local.env"
mkdir "${O_DB_LOC_PATH}/import/airtable"
cp "${HOME}/Downloads/Dot-Export All.csv" "./db/airtable/tmp/dot.csv"
cp "./db/airtable/tmp/dot.csv" "${O_DB_LOC_PATH}/import/airtable/dot.csv"
executeLocalCypher "./db/airtable/load.cyp"
echo "################################################################"
