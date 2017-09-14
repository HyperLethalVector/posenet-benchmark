#!/bin/bash
BEGIN=$(date +%s%3N)
./build/tools/caffe train -solver ./build/tools/solver_posenet.prototxt -gpu all
END=$(date +%s%3N)

DIFF=`expr $END - $BEGIN`

echo "Time Taken in milliseconds"
echo $DIFF
