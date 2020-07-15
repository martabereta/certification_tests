#!/bin/bash
pwd
ibmcloud ks cluster get --cluster mycluster-ls3 | grep ^State