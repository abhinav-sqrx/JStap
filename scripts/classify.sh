#!/bin/bash

# To be launched from the scripts folder.
# Samples classification with
# $1 = tokens, ast, cfg, pdg-dfg, or pdg
# $2 ngrams or value


./variables.sh $1 $2 test
echo "Finished samples classification"