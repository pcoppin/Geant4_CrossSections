#!/bin/bash

primary="C13"

for target in Bi C Ge H O Pb Si W
do
    python Gen-ion_input_file.py $target;
    ./Hadr00 ion_file.in FTFP > hadr00.out;
    python ../ReadPlotCrossSections/ProcessG4OutFile.py $primary $target;
done
