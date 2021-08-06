#!/bin/sh

clear

echo "################################################################"
. "./env/local.env"

loadSourceTable(){
  wget -O "./db/northwind/table/products.csv"       "http://data.neo4j.com/northwind/products.csv"
  wget -O "./db/northwind/table/categories.csv"     "http://data.neo4j.com/northwind/categories.csv"
  wget -O "./db/northwind/table/suppliers.csv"      "http://data.neo4j.com/northwind/suppliers.csv"
  wget -O "./db/northwind/table/customers.csv"      "http://data.neo4j.com/northwind/customers.csv"
  wget -O "./db/northwind/table/orders.csv"         "http://data.neo4j.com/northwind/orders.csv"
  wget -O "./db/northwind/table/order-details.csv"  "http://data.neo4j.com/northwind/order-details.csv"
}

if [ -z "$(ls -A "./db/northwind/table/")" ]; then
   echo "Source table folder is empty, downloading..."
   loadSourceTable
else
   echo "Source table folder is not empty, not downloading"
fi

echo "----------------------------------------------------------------"

mkdir "${O_DB_LOC_PATH}/import/northwind"
cp -r ./db/northwind/table/* "${O_DB_LOC_PATH}/import/northwind/"

echo "----------------------------------------------------------------"

executeLocalCypher "./cyp/clear.cyp"
executeLocalCypher "./db/northwind/load.cyp"

echo "################################################################"
