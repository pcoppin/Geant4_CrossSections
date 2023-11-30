import sys

Elm = sys.argv[1]

template="""/control/cout/ignoreThreadsExcept 0
/control/verbose 1
/run/verbose 1
/tracking/verbose 0

/testhadr/verbose    1
/testhadr/particle   proton

/testhadr/targetElm        {}
/testhadr/TargetMat        G4_{}
/testhadr/TargetRadius     2  cm
/testhadr/TargetLength     50 cm

/testhadr/minEnergy   1 keV
/testhadr/maxEnergy   10000 TeV

/run/printProgress 10
/run/setCut           1 km

/testhadr/RadDecay true
/run/initialize
/process/em/workerVerbose 0

/gun/energy 20. GeV
/testhadr/verbose 1
/run/beamOn 10"""

with open('ion_file.in', 'w') as infile:
    infile.write( template.format(Elm,Elm) )