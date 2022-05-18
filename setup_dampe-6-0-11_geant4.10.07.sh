#!/bin/bash
wd=$(pwd)
export cvbase=/cvmfs/dampe.cern.ch/centos7
export PYTHON_VERSION=2.7.14
export CMAKE_VERSION=3.9.3
export BOOST_VERSION=1.65.1
export BOOST_VERSION_STR=1_65_1
export SCONS_VERSION=2.5.1
export XERCESC_VERSION=3.2.0
export ROOT_VERSION=5-34-36
export GEANT4_VERSION=4.10.07
export GEANT4_VERSION_STR=4_10_07
export RELEASE_DIR=${cvbase}/opt/DMPSW
export LD_LIBRARY_PATH=${cvbase}/lib:${cvbase}/lib64
export CC=${cvbase}/opt/rh/devtoolset-4/root/usr/bin/gcc
export CXX=${cvbase}/opt/rh/devtoolset-4/root/usr/bin/g++
export FC=${cvbase}/opt/rh/devtoolset-4/root/usr/bin/gfortran
# use conda's python
export PATH=${cvbase}/opt/conda/bin:$PATH
export LD_LIBRARY_PATH=${cvbase}/opt/conda/lib:${LD_LIBRARY_PATH}
# add cvmfs-bin path
export PATH=${cvbase}/bin:${PATH}
# cleanup any existing LD_LIBRARY_PATH stuff
# set up the newer GCC from the devtoolset
source ${cvbase}/opt/rh/devtoolset-4/enable
# adding root
cd ${cvbase}/opt/root-5*
source ./bin/thisroot.sh
cd ${wd}

# adding mysql connector
cd ${cvbase}/opt/mysql-*
export SQL_PATH=`pwd`
export LIBRARY_PATH=${SQL_PATH}/lib:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${SQL_PATH}/lib:${LD_LIBRARY_PATH}
export DYLD_LIBRARY_PATH=${SQL_PATH}/lib:${DYLD_LIBRARY_PATH}
export CPATH=${SQL_PATH}/include:${CPATH}
cd ${wd}

# adding boost
export LIBRARY_PATH=${cvbase}/lib:${cvbase}/lib64:${cvbase}/opt/conda/lib:$LIBRARY_PATH

# adding HEPMC 2018-10-19
export HEPMC_PREFIX=${cvbase}/opt/HepMC-2.06.09

# adding CRMC 2018-10-20
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${cvbase}/opt/G4CRMC/lib
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:${cvbase}/opt/G4CRMC/lib
export CPATH=${CPATH}:${cvbase}/opt/G4CRMC/src
#comment out after updating CRMC to v1.8
#export CPATH=${CPATH}:${cvbase}/src/crmc/src
export CRMC_CONFIG_FILE=${cvbase}/opt/G4CRMC/crmc.param

# adding Geant4
cd ${cvbase}/opt/geant4.10.07/share/Geant4-10.7.0/geant4make
source ./geant4make.sh
cd ${wd}

rootenv6(){
  unset ROOTSYS
  wd=$(pwd)
  cd ${cvbase}/opt/root-6*/bin
  source ./thisroot.sh
  cd ${wd}
}

dampe_init(){
  if (( $# == 0 )); then release="latest";
  else release=$1; fi
  workdir=$(pwd)
  echo "DAMPE software setup - core"
  cd ${RELEASE_DIR}/${release}
  echo "DmpBuild: $(readlink -f .)"
  source ./bin/thisdmpsw.sh
  cd ${workdir}
}

set_virtualenv(){
  if (( $# == 0 )); then MY_PATH=${HOME};
  else MY_PATH=$1; fi
  export WORKON_HOME=${MY_PATH}/virtualEnvs/
  mkdir -p $WORKON_HOME
  source $(which virtualenvwrapper.sh)
}
