# Install script for directory: /lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/sorc/ncep_tcv_ecmwf.fd

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/exec/tcvital_ch_ecmwf" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/exec/tcvital_ch_ecmwf")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/exec/tcvital_ch_ecmwf"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/exec/tcvital_ch_ecmwf")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/exec" TYPE EXECUTABLE FILES "/lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/build/sorc/ncep_tcv_ecmwf.fd/tcvital_ch_ecmwf")
  if(EXISTS "$ENV{DESTDIR}/lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/exec/tcvital_ch_ecmwf" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/exec/tcvital_ch_ecmwf")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/exec/tcvital_ch_ecmwf"
         OLD_RPATH "/apps/prod/hpc-stack/intel-19.1.3.304/cray-mpich-8.1.4/netcdf/4.7.4/lib:/pe/intel/compilers_and_libraries_2020.4.304/linux/mpi/intel64/lib:/pe/intel/compilers_and_libraries_2020.4.304/linux/mpi/intel64/lib/release:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/lfs/h2/emc/ens/noscrub/hananeh.jafary/ens_update_src/exec/tcvital_ch_ecmwf")
    endif()
  endif()
endif()

