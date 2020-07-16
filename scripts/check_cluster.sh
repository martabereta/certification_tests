#!/bin/bash

EXPECTED_STATE='normal'
#EXPECTED_STATE='deploying'
ACTUAL_STATE="$(ibmcloud ks cluster get --cluster $1 | grep ^State)"
ACTUAL_STATE="${ACTUAL_STATE#*:}"
echo "Expected state" $EXPECTED_STATE
echo "Actual state" $ACTUAL_STATE


until [ $ACTUAL_STATE == $EXPECTED_STATE ]
do
  echo "I'm waiting for one minute"
  sleep 1m
  ACTUAL_STATE="$(ibmcloud ks cluster get --cluster $1 | grep ^State)"
  ACTUAL_STATE="${ACTUAL_STATE#*:}"
  echo "Updated actual state" $ACTUAL_STATE
  #EXPECTED_STATE="normal"
  #sleep 5
done

echo "Cluster is ready!"
