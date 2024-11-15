Instructions to self:

Examples copied from /cvmfs/dampe.cern.ch/centos7/opt/geant4/share/Geant4-10.5.1/examples

4.10.05p01 and 4.10.07 have to be run on Baobab or Yggdrasil (not compiling on gridvm10 atm)
4.10.03p02 has to be run on gridvm12 (was missing some libraries which I added there)

* First set the particle on which to run:
    - Go modify Hadr00/src/HistoManager.cc to select either default particles (proton/alpha) or ions
    - For proton and alpha, set /testhadr/particle in Gen_input_file.py to either 'proton' or 'alpha' or 'deuteron'
    - For ions, choose ion in HistoManager.cc according to instructions there

* Compile the Geant4 example for the chosen particle:
    > cvmfs; dampe_init; echo $GEANT4_VERSION;
        or a different Geant environment, e.g.
        source setup_dampe-6-0-11_geant4.10.07.sh
        source setup_cvmfs_with_Geant4-10.3.2.sh
    > cd ExampleName
    > mkdir build
    > cd build
    > cmake -DGeant4_DIR=${cvbase}/opt/geant4.10.05p01/share/Geant4-10.5.1 ..
           OR > cmake -DGeant4_DIR=${cvbase}/opt/geant4.10.07/share/Geant4-10.7.0 ..
           IR > cmake -DGeant4_DIR=${cvbase}/opt/geant4.10.03p02/share/Geant4-10.3.2 ..
    > make

    Or all in one (assuming you build directory already exists and you are in it):
      rm -r CMakeCache*; cmake -DGeant4_DIR=${cvbase}/opt/geant4.10.05p01/share/Geant4-10.5.1 ..; make;

    ### INSTRUCTION FOR GEANT4.11.2 (on atlas076)
    source /cvmfs/sft.cern.ch/lcg/releases/gcc/11.2.0/x86_64-centos7/setup.sh 
    source /cvmfs/sft.cern.ch/lcg/views/LCG_105/x86_64-centos7-gcc11-opt/setup.sh 
    cd ~/bee/GeantExamples/Hadr00/build_G11/Hadr00/build/
    ls
    cmake ..
    make

* Run the compiled binary:
    - For a single target: ./Hadr00 hadr00_custom.in FTFP > hadr00.out
        i.e. program inputfile physicsmodel > outputfile
    
    - In an automated way:
        * Set the name of the chosen primary and physics-model in build/Automate.sh
        * In ReadPlotCrossSections/ProcessG4OutFile.py:
             - Set the name of the physics-model 
             - Set the correct output directory (which depends on the Geant4 version)
        * Run ./Automate.sh






### INSTRUCTION FOR GEANT4.11.2 (on atlas076)
source /cvmfs/sft.cern.ch/lcg/releases/gcc/11.2.0/x86_64-centos7/setup.sh 
source /cvmfs/sft.cern.ch/lcg/views/LCG_105/x86_64-centos7-gcc11-opt/setup.sh 
cd ~/bee/GeantExamples/Hadr00/build_G11/Hadr00/build/
ls
cmake ..
make




Geant4 docu: https://geant4-dev.web.cern.ch/docs/
Materials: https://www.fe.infn.it/u/paterno/Geant4_tutorial/slides_further/Geometry/G4_Nist_Materials.pdf

