#!/bin/bash

export FMRIDIR=$HOME/fmri

#ANTs
export ANTSPATH=`readlink -f $FMRIDIR/ants.bin/bin`/
export ANTSCRIPTD=`readlink -f $FMRIDIR/ants.src/Scripts`/

#for afni
export DYLD_FALLBACK_LIBRARY_PATH=$FMRIDIR/afni.bin 
export AFNI_DONT_LOGFILE=YES

#freesurfer
export FS_FREESURFERENV_NO_OUTPUT='YES'
export FREESURFER_HOME=$FMRIDIR/freesurfer
export FSL_DIR=$FMRIDIR/fsl
importrc $FMRIDIR/freesurfer/SetUpFreeSurfer.sh
export FSF_OUTPUT_FORMAT=nii

#FSL , must after freesurfer
export FSLDIR=$FMRIDIR/fsl
importrc $FSLDIR/etc/fslconf/fsl.sh
export FSLOUTPUTTYPE=NIFTI


#dicom
export MANPATH=$FMRIDIR/dcmtk/share/man:$MANPATH
export GDCM_RESOURCES_PATH=$FMRIDIR/gdcm/share/gdcm-2.0/XML/
export DCMDICTPATH=$FMRIDIR/dcmtk/share/dcmtk/dicom.dic:$FMRIDIR/dcmtk/share/dcmtk/private.dic:$FMRIDIR/dcmtk/share/dcmtk/diconde.dic


export CPPFLAGS=" -I$FMRIDIR/niftitools/include $CPPFLAGS"
export LDFLAGS="-L$FMRIDIR/niftitools/lib $LDFLAGS"


#MINC
importrc $FMRIDIR/minc/minc-toolkit-config.sh


#CAMIRO DTI
export CAMINO_HEAP_SIZE=8000
export MANPATH=$FMRIDIR/camino/man:$MANPATH

#ART
export ARTHOME=$FMRIDIR/ART/art

#itksnap
alias snap='itksnap.sh'

#afni, freesurfer.qa, ants.bin
export PATH=$(tr -s ' \n' ':' <<eot
$FMRIDIR/bin
$FMRIDIR/afni.bin
$FSLDIR/bin
$FMRIDIR/freesurfer.qa
$ANTSPATH
$ANTSCRIPTD
$FMRIDIR/itksnap/itksnap64/bin/
$FMRIDIR/itksnap/c3d/bin/
$FMRIDIR/camino/bin
$FMRIDIR/diffusion.toolkit/dtk
$FMRIDIR/elastix/bin
$FMRIDIR/ART/art/bin
$FMRIDIR/robex
$FMRIDIR/mricron
$FMRIDIR/MRIConvert/bin/
$FMRIDIR/gary.fmri.bin
$FMRIDIR/dcm4che/bin
$FMRIDIR/dcmtk/bin
$FMRIDIR/gdcm/bin
$FMRIDIR/MRIConvert/bin
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
$FMRIDIR/elastix/lib
$FMRIDIR/gdcm/lib
eot
):$LD_LIBRARY_PATH




##interactive mode
if [[ $- == *i* ]]; then
    #ITKSnap comp
    source $FMRIDIR/itksnap/c3d/share/bashcomp.sh
    #add afni auto complete
    ahdir=`apsearch -afni_help_dir`
    if [ -f "$ahdir/all_progs.COMP.bash" ]; then
       . $ahdir/all_progs.COMP.bash
    fi
fi
