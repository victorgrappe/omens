#!/bin/sh

clear

echo "################################################################"
. "./env/local.env"
mv "${HOME}/Downloads/Dot-All.csv" "./db/airtable/tmp/dot.csv"
echo "################################################################"
