#!/bin/bash

dirfmri=$HOME/fmri

#afni, freesurfer.qa, ants.bin
pathmunge_many $dirfmri/afni.bin  $dirfmri/freesurfer.qa  
#for afni
export DYLD_FALLBACK_LIBRARY_PATH=$dirfmri/afni.bin 

#ANTs
export ANTSPATH=`readlink -f $dirfmri/ants.bin/bin`/
#pathmunge_many $HOME/fmri/ants.bin/ $HOME/fmri/ants.scripts/
pathmunge_many $ANTSPATH  

#robex for robust skull strip
pathmunge $dirfmri/robex

#mricron
pathmunge $dirfmri/mricron


#freesurfer
export FREESURFER_HOME=$dirfmri/freesurfer
export FSL_DIR=$dirfmri/fsl
importrc $dirfmri/freesurfer/SetUpFreeSurfer.sh

#FSL 5.0.4, must after freesurfer
export FSLDIR=$dirfmri/fsl
importrc $FSLDIR/etc/fslconf/fsl.sh
pathmunge $FSLDIR/bin


#Gary H. Glover scripts for Spirol raw data conversion
pathmunge $dirfmri/gary.fmri.bin


#dicom
pathmunge $dirfmri/dcmtk/bin
export MANPATH=$dirfmri/dcmtk/share/man:$MANPATH

#nifti tools
pathmunge_many $dirfmri/niftitools/bin/ $dirfmri/niftitools/python  $dirfmri/niftitools/misc/wuminn-connectome/
ldPathMunge  $dirfmri/niftitools/lib
export CPPFLAGS=" -I$dirfmri/niftitools/include $CPPFLAGS"
export LDFLAGS="-L$dirfmri/niftitools/lib $LDFLAGS"

#fBIRN
pathmunge $dirfmri/fbirn/bin after
#pathmunge $dirfmri/fbirn.cde


#MINC
export LIBMINC_DIR=$HOME/bak/bic.mni.minc/libminc/build
importrc $dirfmri/minc/minc-toolkit-config.sh


#XNAT
pathmunge $dirfmri/xnat/xnat_tools/
#pipeline scripts dir
pathmunge $dirfmri/pipeline4nu

#pycap///masimatlab////pyxnat
export XNAT_USER=dawnsong
export XNAT_PASS=dawnsong!
export XNAT_HOST=http://nunda.northwestern.edu:8080/nunda

#CAMIRO DTI
export CAMINO_HEAP_SIZE=8000
export MANPATH=$dirfmri/camino/man:$MANPATH
pathmunge $dirfmri/camino/bin


#ART
export ARTHOME=$dirfmri/ART/art
pathmunge $dirfmri/ART/art/bin

#for fMRI common lib
export LD_LIBRARY_PATH=$dirfmri/nifticlib/lib:$LD_LIBRARY_PATH   #:$dirfmri/lib
