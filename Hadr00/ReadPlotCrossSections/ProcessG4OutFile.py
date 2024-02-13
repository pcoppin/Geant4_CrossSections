from __future__ import print_function, division, absolute_import
from glob import glob
import numpy as np
import matplotlib
import matplotlib.pyplot as plt

import os, sys

Primary = sys.argv[1]
Material = sys.argv[2]
Model = "FTFP"

in_file = "../build/hadr00.out"
with open(in_file) as f:
    lines = f.readlines()
    
start_where = ["### Fill Cross Sections for" in x for x in lines]
start_index = np.where(start_where)[0][0] + 4
if( lines[start_index].split()[0]!="0" ):
    raise Exception("Index first data point should be zero")

variable_names = lines[start_index-2].split()
data = {name: [] for name in variable_names}
for line in lines[start_index:]:
    if( line[0]=="-" ):
        break
    else:
        data_i = line.split()
        for name, x in zip(variable_names,data_i):
            data[name].append( float(x) )

with open("../ReadPlotCrossSections/CrossSections_11_2/Geant4_{}_{}_on_{}.txt".format(Model,Primary,Material), "w") as f:
    f.write("# Energy (GeV)      Cross section (barn)\n")
    for E, s in zip(data['E(MeV)'],data['Inelastic(b)']):
        f.write("  {:<17.3e} {:.3e}\n".format(1e-3*E,s))