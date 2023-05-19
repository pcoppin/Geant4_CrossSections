Instructions to self:

Examples copied from /cvmfs/dampe.cern.ch/centos7/opt/geant4/share/Geant4-10.5.1/examples

Has to be run on Baobab or Yggdrasil (not compiling on gridvm10 atm)

    > cvmfs; dampe_init; echo $GEANT4_VERSION;
        or a different Geant environment, e.g.
        source setup_dampe-6-0-11_geant4.10.07.sh
    > cd ExampleName
    > mkdir build
    > cd build
    > cmake -DGeant4_DIR=${cvbase}/opt/geant4.10.05p01/share/Geant4-10.5.1 ..
           OR > cmake -DGeant4_DIR=${cvbase}/opt/geant4.10.07/share/Geant4-10.7.0 ..
    > make



rm -r CMakeCache*; cmake -DGeant4_DIR=${cvbase}/opt/geant4.10.05p01/share/Geant4-10.5.1 ..; make; ./Automate.sh;


- B1 example: requires visuals and does not appear to work on the cluster

- Hadr00 example:
    Will generate cross sections
    > ./Hadr00 hadr00.in QGSP_BERT > hadr00.out
      ./Hadr00 hadr00_custom.in FTFP > hadr00.out
        i.e. program inputfile physicsmodel > outputfile
        Hadr01:
            Consistency check that results is independent of /testhadr/TargetRadius, /testhadr/TargetLength, and /gun/energy


Geant4 docu: https://geant4-dev.web.cern.ch/docs/
Materials: https://www.fe.infn.it/u/paterno/Geant4_tutorial/slides_further/Geometry/G4_Nist_Materials.pdf








source /cvmfs/sft.cern.ch/lcg/contrib/gcc/9.2.0/x86_64-centos7/setup.sh
source /cvmfs/geant4.cern.ch/geant4/11.0_cand01/x86_64-centos7-gcc8-optdeb-MT/bin/geant4.sh
source /cvmfs/geant4.cern.ch/geant4/11.1/x86_64-centos7-gcc9-optdeb/CMake-setup.sh
export PATH=/cvmfs/sft.cern.ch/lcg/contrib/CMake/3.18.3/Linux-x86_64/bin/:${PATH}
cmake -DGeant4_DIR=/cvmfs/geant4.cern.ch/geant4/11.1/x86_64-centos7-gcc9-optdeb/share/Geant4 ..

can cmake, but make fails with
make[2]: *** No rule to make target `/usr/lib64/libXm.so', needed by `Hadr00'.  Stop.
make[1]: *** [CMakeFiles/Hadr00.dir/all] Error 2
make: *** [all] Error 2