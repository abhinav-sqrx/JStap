#!/bin/bash

# Main script: shares variables to either train a classifier with a specific JStap module, classify JS samples with a specific JStap module, or train/classify with all ten modules.


samples_path='../samples/'

level=$1
features_choice=$2
action=$3

pdg='/Analysis/PDG'

analysis_path='../Analysis/'
model_dir=${analysis_path}Model/
model_name=$features_choice'_'$level
model_path=$model_dir$model_name


if [ $level = tokens ]; then
    pdg=''
fi

if [ $action = train ]; then
   echo "Beginning classifier training from $samples_path with $level and $features_choice"
   python3 ../classification/learner.py --d $samples_path'Good-train'$pdg $samples_path'Bad-train'$pdg --l benign malicious --vd $samples_path'Good-validate'$pdg $samples_path'Bad-validate'$pdg --vl benign malicious --level $level --features $features_choice --mn $model_name --md $model_dir --analysis_path $analysis_path

elif [ $action = test ]; then
   echo "Beginning the classification of samples from $samples_path with $level and $features_choice"
   python3 ../classification/classifier.py --d $samples_path'Good-test'$pdg  $samples_path'Bad-test'$pdg --l benign malicious --level $level --features $features_choice --m $model_path --analysis_path $analysis_path

elif [ $action = all ]; then
  results=$analysis_path'Results/'
  mkdir $results

  for level in tokens ast cfg pdg-dfg pdg; do
    for features_choice in ngrams value; do
      logs=$results$features_choice'_'$level'.txt'
      ./train.sh $level $features_choice
      ./classify.sh $level $features_choice >> $logs
    done
  done

fi
