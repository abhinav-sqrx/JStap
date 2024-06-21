#!/bin/bash

# To be launched from the scripts folder.
# Classifier training with
# $1 = tokens, ast, cfg, pdg-dfg, or pdg
# $2 ngrams or value


./variables.sh $1 $2 train
echo "Finished classifier training"