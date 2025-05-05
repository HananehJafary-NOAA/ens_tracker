#!/bin/sh

set -eux
source ./machine-setup.sh > /dev/null 2>&1

#Supports Debug or Release modes for the build
BUILD_MODE=${BUILD_MODE:-Release}

cwd=$(pwd)

if [ "${BUILD_MODE}" = Release ]; then
  export BUILD_TYPE=RELEASE
else
   export BUILD_TYPE=DEBUG
fi

module use ../../modulefiles
module load $clustername
module list


if [ $clustername = hera ]; then
  export FC=ifort
  export F90=ifort
  export CC=icc
elif [ $clustername = orion ]; then
  export FC=ifort
  export F90=ifort
  export CC=icc
elif [ $clustername = hercules ]; then
  export FC=ifort
  export F90=ifort
  export CC=icc
elif [ $clustername = jet ]; then
  export FC=ifort
  export F90=ifort
  export CC=icc
elif [ $clustername = wcoss2 ] ; then
  export FC=ftn
  export F90=ftn
  export CC=icc
else
  echo "Unknown machine = $clustername"
  exit 1
fi

cd $cwd

echo $cwd
if [ -d "build" ]; then
  rm -rf build
fi
mkdir build
cd build

cmake .. -DCMAKE_Fortran_COMPILER=ifort -DCMAKE_C_COMPILER=icc -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
make -j 8 VERBOSE=1
make install


exit
