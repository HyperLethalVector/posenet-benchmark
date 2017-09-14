#!/bin/bash

mkdir build
cd ./build
cmake ..
make -j8
cd ../bin
cp -r ./ ../build/tools/
 
cd ../build/tools/
res1=$(date +%s.%N)
./caffe train -solver ./solver_posenet.prototxt -gpu 0
res2=$(date +%s.%N)
dt=$(echo "$res2 - $res1" | bc)
dd=$(echo "$dt/86400" | bc)
dt2=$(echo "$dt-86400*$dd" | bc)
dh=$(echo "$dt2/3600" | bc)
dt3=$(echo "$dt2-3600*$dh" | bc)
dm=$(echo "$dt3/60" | bc)
ds=$(echo "$dt3-60*$dm" | bc)

printf "Total runtime (d,h,m,s): %d:%02d:%02d:%02.4f\n" $dd $dh $dm $ds
