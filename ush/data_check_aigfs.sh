#!/bin/ksh
export PS4=' + data_check_aigfs.sh line $LINENO: '
set -x

####################################
# Specify Timeout Behavior for TC Track calculations
# SLEEP_TIME - Amount of time to wait for a input-data file before exiting
# SLEEP_INT  - Amount of time to wait between checking for input-data file
####################################
export SLEEP_TIME=3600
export SLEEP_INT=60
SLEEP_LOOP_MAX=`expr $SLEEP_TIME / $SLEEP_INT`

if [ ${cmodel} = "aigfs" ]; then
  datdir=${aigfsdir}
  vit_incr=${FHOUT_CYCLONE:-6}                        
  fcstlen=${FHMAX_CYCLONE:-240}                       
  fcsthrs=$(seq -f%03g -s' ' 0 $vit_incr $fcstlen)    
fi

ic=0
while [ $ic -lt $SLEEP_LOOP_MAX ]; do
  echo "Check for the existence of the files in ${datdir}"

  ic1=0
  for fhour in ${fcsthrs}; do
    datfilea=aigfs.t${cyc}z.pres.f${fhour}.grib2
    datfileb=aigfs.t${cyc}z.sfc.f${fhour}.grib2
    if [ ! -s ${datdir}/${datfilea} -o ! -s ${datdir}/${datfileb} ]; then
      set +x
      echo " "
      echo "AIGFS file missing: ${datdir}/${datfile}"
      echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      echo " "
      set -x
      ic1=`expr $ic1 + 1`
    fi
  done

  if [ $ic1 -eq 0 ]; then
    echo " !!!  $ic1 files missing in ${datdir} after waiting $ic minutes"
    break
  else
    sleep $SLEEP_INT
  fi
  ic=`expr $ic + 1`
###############################
# After we wait for 60 minutes, no data is available, Job will be quit. 
###############################
  if [ $ic -eq $SLEEP_LOOP_MAX ]; then
    msg="FATAL ERROR: $ic1 files missing in ${datdir}"
    echo "$msg"; postmsg "$jlogfile" "$msg"
    exit 6
  fi
done
