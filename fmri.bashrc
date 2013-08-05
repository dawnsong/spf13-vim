#!/bin/bash

dirfmri=$HOME/fmri

#ANTs
export ANTSPATH=`readlink -f $dirfmri/ants.bin/bin`/
#for afni
export DYLD_FALLBACK_LIBRARY_PATH=$dirfmri/afni.bin 

#freesurfer
export FREESURFER_HOME=$dirfmri/freesurfer
export FSL_DIR=$dirfmri/fsl
importrc $dirfmri/freesurfer/SetUpFreeSurfer.sh

#FSL 5.0.4, must after freesurfer
export FSLDIR=$dirfmri/fsl
importrc $FSLDIR/etc/fslconf/fsl.sh


#dicom
export MANPATH=$dirfmri/dcmtk/share/man:$MANPATH


export CPPFLAGS=" -I$dirfmri/niftitools/include $CPPFLAGS"
export LDFLAGS="-L$dirfmri/niftitools/lib $LDFLAGS"


#MINC
importrc $dirfmri/minc/minc-toolkit-config.sh


#CAMIRO DTI
export CAMINO_HEAP_SIZE=8000
export MANPATH=$dirfmri/camino/man:$MANPATH

#ART
export ARTHOME=$dirfmri/ART/art

#afni, freesurfer.qa, ants.bin
export PATH=$(tr -s ' \n' ':' <<eot
$dirfmri/bin
$dirfmri/afni.bin
$FSLDIR/bin
$dirfmri/freesurfer.qa
$ANTSPATH
$dirfmri/camino/bin
$dirfmri/ART/art/bin
$dirfmri/robex
$dirfmri/mricron
$dirfmri/gary.fmri.bin
$dirfmri/dcmtk/bin
$dirfmri/xnat/xnat_tools/
$dirfmri/niftitools/bin/ 
$dirfmri/niftitools/python  
$dirfmri/niftitools/misc/wuminn-connectome/
$dirfmri/fbirn/bin
eot
):$PATH
#for fMRI common lib
export LD_LIBRARY_PATH=$(tr -s ' \n' ':' <<eot
$dirfmri/lib
$dirfmri/nifticlib/lib
$dirfmri/niftitools/lib
eot
):$LD_LIBRARY_PATH
