#!/bin/bash

while read line
do
 for word in $line; do
   hdfs dfs -copyToLocal $word /tmp/hspace/datasets
   file=`echo $word|awk '{print substr($0,37,47);}'` # check this line, possible bug
   cd /tmp/hspace
   ./sciphy.sh $file
 done
done

