#!/bin/bash
ibmcloud ks cluster get --cluster $1 | grep ^State