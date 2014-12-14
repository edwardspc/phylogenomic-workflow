#!/usr/bin/env bash

SCIPHY_HOME=`pwd`
SCRIPTS=$SCIPHY_HOME/scripts
JAR=$SCIPHY_HOME/jar
DATASET=$SCIPHY_HOME/datasets
OUTPUT="output"

if [ -n "$1" ]; then
  dataset_files=$1
else
  dataset_files=( $(ls datasets) )
fi

for i in "${dataset_files[@]}"
do

  INPUT_FILE=$i
  OUTPUT_HOME=$SCIPHY_HOME/$OUTPUT-$INPUT_FILE
  rm -rf $SCIPHY_HOME/$OUTPUT-$INPUT_FILE > /dev/null
  mkdir $SCIPHY_HOME/$OUTPUT-$INPUT_FILE

  echo $INPUT_FILE
  perl $SCRIPTS/numberFasta.pl $DATASET/$INPUT_FILE > $OUTPUT_HOME/$INPUT_FILE.fastaNumbered

  mafft $OUTPUT_HOME/$INPUT_FILE.fastaNumbered > $OUTPUT_HOME/$INPUT_FILE.mafft

  java -jar $JAR/readseq.jar -all -f=12 $OUTPUT_HOME/$INPUT_FILE.mafft -o $OUTPUT_HOME/$INPUT_FILE.phylip > /dev/null

  cd $OUTPUT_HOME
  java -jar $JAR/modelgenerator.jar $INPUT_FILE.phylip 6 > /dev/null
  mv modelgenerator*.out $INPUT_FILE.mg

  python $SCRIPTS/clean_modelgenerator.py $OUTPUT_HOME/$INPUT_FILE.mg

  python $SCRIPTS/execute_raxml.py $OUTPUT_HOME $OUTPUT_HOME/$INPUT_FILE.phylip $OUTPUT_HOME/$INPUT_FILE.mg.modelFromMG.txt 2 4

done
