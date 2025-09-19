#!/bin/bash
set -x -e
if [[ ! -d ../exec ]] ; then mkdir ../exec ; fi

if [[ -d /lfs/h1 ]] ; then
  # We are on NOAA wcoss2
  machine=wcoss2
  module purge
#  source ../modulefiles/build.module_load
  source ../versions/build.ver

  module load envvar/${envvar_ver}
  module load PrgEnv-intel/${PrgEnv_intel_ver}
  module load intel/${intel_ver}
  module load craype/${craype_ver}

  module load hdf5/${hdf5_ver}
  module load netcdf/${netcdf_ver}

  module load g2/${g2_ver}
  module load jasper/${jasper_ver}
  module load libpng/${libpng_ver}
  module load zlib/${zlib_ver}

  module load w3emc/${w3emc_ver}
  module load bacio/${bacio_ver}


  export INC="${G2_INCd} -I${NETCDF_INCLUDES}"
  export LIBS="${W3EMC_LIBd} ${BACIO_LIB4} ${G2_LIBd} ${PNG_LIB} ${JASPER_LIB} ${Z_LIB} -L${NETCDF_LIBRARIES} -lnetcdff -lnetcdf"
  export LIBS_SUP="${W3EMC_LIBd}"
  export LIBS_UK="${W3EMC_LIBd} ${BACIO_LIB4}"

  for dir in *.fd; do
    cd $dir
    make clean
    make -f makefile
    make install
    cd ..
  done

else
  export machine=unknown
  echo Compile failed: unknown platform 1>&2
fi

