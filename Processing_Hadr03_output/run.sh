# source /cvmfs/sft.cern.ch/lcg/releases/gcc/6.3.0/x86_64-centos7/setup.sh 
# source /cvmfs/geant4.cern.ch/geant4/10.5.p01/x86_64-centos7-gcc63-opt-MT/CMake-setup.sh 

exe='/USERS/coppinp/Code/GeantExamples/Hadr03_G4.10.5p01/build/Hadr03'

for i in $(seq 1 0.1 4);
    do energy=$(python -c "print(10**$i)"); 
    ff="${energy} GeV"
    echo "Working on: ${ff}"
    sed "s/XYZ/${ff}/g" inelastic_BGO_template.mac > inelastic_BGO.mac;
    time $exe inelastic_BGO.mac 32 > Hadr03.log;
    mv inelastic.root root_files/Proton_${ff// /_}_1e5-10-05-p01.root;
done;
