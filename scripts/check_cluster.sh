#!/bin/bash

ibmcloud ks cluster get --cluster $1 | grep ^State

EXPECTED_STATE='normal'
ACTUAL_STATE='ibmcloud ks cluster get --cluster $1 | grep ^State'
until [ "$ACTUAL_STATE" != *"$EXPECTED_STATE"* ]
do
  echo "I'm waiting for one minute"
  sleep 1m
  ACTUAL_STATE = 'ibmcloud ks cluster get --cluster $1 | grep ^State'
done

echo "Cluster is ready!"
