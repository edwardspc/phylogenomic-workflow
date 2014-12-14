#!/bin/bash

while read line
do
 for word in $line; do
   echo $word
   hdfs dfs -copyToLocal $word /tmp/hspace/datasets
   file=`echo $word|awk '{print substr($0,37,47);}'`
   echo $file >> /tmp/hspace/file.txt
   cd /tmp/hspace
   ./sciphy.sh $file
 done
done

