SHELL=/bin/sh
# Vortex Tracker makefile
#------------
# Include machine dependent compile & load options
#------------
include ./configure.trk

SUBDIRS = gfdl_tracker ens_trak_ave.fd filter_ukmet.fd filter_navgem.fd filter_gfs.fd filter_ecmwf.fd \
	  filter_cmc.fd ens_trak_ave_2d.fd rhum_g2.fd readtcv.fd readprobLL.fd readprob.fd ncep_tcv_ukmet.fd \
	  ncep_tcv_navgem.fd ncep_tcv_gfs.fd ncep_tcv_ecmwf.fd ncep_tcv_cmc.fd wsr_ecmwfens.fd ushear_g2.fd \
	  ushear_g1.fd ukmet.fd

all: $(SUBDIRS)

$(SUBDIRS)::
	cd $@ ; make

clean::
	@for dir in $(SUBDIRS); do \
           ( cd $$dir; echo "Making $@ in `pwd`" ; \
             make $@ ); \
        done
	$(RM) exec/*.x
