#!/bin/sh

clear

echo "################################################################"
. "./env/local.env"

extractNed(){
  SCALE=${1}
  CATEGORY=${2}
  wget -O "./db/ned/local/${SCALE}_${CATEGORY}.zip" "https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/${SCALE}/${CATEGORY}/${SCALE}_${CATEGORY}.zip"
  unzip "./db/ned/local/${SCALE}_${CATEGORY}.zip" -d "./db/ned/local/${SCALE}_${CATEGORY}"
}

extractNed "10m" "cultural"
extractNed "10m" "physical"

echo "################################################################"
