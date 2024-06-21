#!/bin/bash

# To be launched from the scripts folder.
# Generation of the PDGs from JStap/samples/Bad-validate


samples_path='../samples/Bad-validate'
level=${1:-"pdg"}

echo "Beginning PDGs generation from $samples_path"

python3 -c "import sys; sys.path.insert(0, '../pdg_generation'); from pdgs_generation import *; store_pdg_folder('$samples_path', '$level')"

echo "Finished PDGs generation"
