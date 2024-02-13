#!/bin/bash

primary="4-HELIUM"

# Put input particle in Gen_input_file.py if not running on ions !!!!!!!!
for target in Bi C Ge H O Pb Si W
do
    python Gen_input_file.py $target;
    #./Hadr00 ion_file.in FTFP > hadr00.out;
    ./../build_G11/Hadr00/build/Hadr00 ion_file.in FTFP > hadr00.out;
    python ../ReadPlotCrossSections/ProcessG4OutFile.py $primary $target;
done
