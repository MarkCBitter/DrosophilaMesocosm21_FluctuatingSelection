#!/bin/bash

while read line ; do 
    set $line
    sbatch ./02I_DownsampBams.orch2021.sbatch $1 $2
done <./Orch2021DownSampParams.txt
