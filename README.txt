Instructions to self:

Examples copied from /cvmfs/dampe.cern.ch/centos7/opt/geant4/share/Geant4-10.5.1/examples

Has to be run on Baobab or Yggdrasil (not compiling on gridvm10 atm)

    > source setup_dampe-6-0-11_geant4.10.07.sh
        or a different Geant environment
    > cd ExampleName
    > mkdir build
    > cd build
    > cmake -DGeant4_DIR=${cvbase}/opt/geant4.10.07/share/Geant4-10.7.0 ..
    > make


- B1 example: requires visuals and does not appear to work on the cluster

- Hadr00 example:
    Will generate cross sections
    > ./Hadr00 hadr00.in QGSP_BERT > Hadro00.out
        i.e. program inputfile physicsmodel > outputfile