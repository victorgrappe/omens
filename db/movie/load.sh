#!/bin/sh

clear

echo "################################################################"
. "./env/local.env"
executeLocalCypher "./cyp/clear.cyp"
executeLocalCypher "./db/movie/load.cyp"
executeLocalCypher "./cyp/match_all.cyp"
echo "################################################################"
