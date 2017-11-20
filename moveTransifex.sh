#!/usr/bin/env bash
# This script takes the transifex downloads and places them on the proper language folder

l=(
    'es::es'
    'fr::fr'
    'ge::de'
    'it::it'
    'ko::ko'
    'nl::nl'
    'cz::cs_CZ'
    'ca::ca'
    'fi::fi'
    'is::is'
)


for index in "${l[@]}" ; do
    KEY="${index%%::*}"
    VALUE="${index##*::}"
  echo "Upgrading strings from $VALUE"
  REGEXP=$(echo 's/translations\/core-geonetwork./source\/locale\/'$VALUE'\/LC_MESSAGES\//g')
  for i in `find translations -name "$VALUE.po" -type f`; 
    do 
      DEST=$(echo $i | sed -e 's/\-\-/\//g' -e $REGEXP) 
      DEST2=${DEST:0:-6}.po
      #in case we don't have the folder from previous buildings
      mkdir -p $(dirname $DEST2)
      cp $i $DEST2;
  done;
done


