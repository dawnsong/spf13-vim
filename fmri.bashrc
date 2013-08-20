#!/bin/bash

export FMRIDIR=$HOME/fmri

#ANTs
export ANTSPATH=`readlink -f $FMRIDIR/ants.bin/bin`/
#for afni
export DYLD_FALLBACK_LIBRARY_PATH=$FMRIDIR/afni.bin 

#freesurfer
export FREESURFER_HOME=$FMRIDIR/freesurfer
export FSL_DIR=$FMRIDIR/fsl
importrc $FMRIDIR/freesurfer/SetUpFreeSurfer.sh

#FSL 5.0.4, must after freesurfer
export FSLDIR=$FMRIDIR/fsl
importrc $FSLDIR/etc/fslconf/fsl.sh
export FSLOUTPUTTYPE=NIFTI


#dicom
export MANPATH=$FMRIDIR/dcmtk/share/man:$MANPATH


export CPPFLAGS=" -I$FMRIDIR/niftitools/include $CPPFLAGS"
export LDFLAGS="-L$FMRIDIR/niftitools/lib $LDFLAGS"


#MINC
importrc $FMRIDIR/minc/minc-toolkit-config.sh


#CAMIRO DTI
export CAMINO_HEAP_SIZE=8000
export MANPATH=$FMRIDIR/camino/man:$MANPATH

#ART
export ARTHOME=$FMRIDIR/ART/art

#
alias snap='itksnap'

#afni, freesurfer.qa, ants.bin
export PATH=$(tr -s ' \n' ':' <<eot
$FMRIDIR/bin
$FMRIDIR/afni.bin
$FSLDIR/bin
$FMRIDIR/freesurfer.qa
$ANTSPATH
$FMRIDIR/camino/bin
$FMRIDIR/ART/art/bin
$FMRIDIR/robex
$FMRIDIR/mricron
$FMRIDIR/gary.fmri.bin
$FMRIDIR/dcmtk/bin
$FMRIDIR/xnat/xnat_tools/
$FMRIDIR/niftitools/bin/ 
$FMRIDIR/niftitools/python  
$FMRIDIR/niftitools/misc/wuminn-connectome/
$FMRIDIR/fbirn/bin
eot
):$PATH
#for fMRI common lib
export LD_LIBRARY_PATH=$(tr -s ' \n' ':' <<eot
$FMRIDIR/lib
$FMRIDIR/nifticlib/lib
$FMRIDIR/niftitools/lib
eot
):$LD_LIBRARY_PATH
