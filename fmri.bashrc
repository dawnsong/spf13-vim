#!/bin/bash

export FMRIDIR=$HOME/fmri

#HCP
importrc $FMRIDIR/hcp.workbench/hcp.bashrc

#ANTs
#module load ANTs
#export ANTSPATH=$(dirname $(readlink -f $(which ANTS)))/
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
export CAMINO_HEAP_SIZE=16000  #16GB for java
export MANPATH=$FMRIDIR/camino/man:$MANPATH
#DTK, Diffusion toolkit
export DTDIR=$FMRIDIR/dtk/
export DSI_PATH=$FMRIDIR/dtk/matrices

#ART
export ARTHOME=$FMRIDIR/ART/art

#itksnap
#alias snap='itksnap.sh'

#afni, freesurfer.qa, ants.bin
export PATH=$(tr -s ' \n' ':' <<eot
$FMRIDIR/bin
$FMRIDIR/maven/bin/
$FMRIDIR/dicomBrowser/bin/
$FMRIDIR/afni.bin
$FSLDIR/bin
$FMRIDIR/freesurfer.qa
$ANTSPATH
$ANTSCRIPTD
$FMRIDIR/itksnap/itksnap64/bin/
$FMRIDIR/itksnap/c3d/bin/
$FMRIDIR/camino/bin
$FMRIDIR/dtk
$FMRIDIR/mrtrix3/release/bin
$FMRIDIR/mrtrix3/scripts
$FMRIDIR/elastix/bin
$FMRIDIR/ART/art/bin
$FMRIDIR/robex
$FMRIDIR/mricron
$FMRIDIR/mango
$FMRIDIR/MRIConvert/bin/
$FMRIDIR/gary.fmri.bin
$FMRIDIR/dcm4che/bin
$FMRIDIR/dcmtk/bin
$FMRIDIR/gdcm/bin
$FMRIDIR/xnat/xnat_tools/
$FMRIDIR/niftitools/bin/ 
$FMRIDIR/niftitools/python  
$FMRIDIR/niftitools/misc/wuminn-connectome/
$FMRIDIR/circos/circos/bin
$FMRIDIR/nlm/
$FMRIDIR/EvaluateSegmentation/bin/
$FMRIDIR/phantomjs/current/bin/
$FMRIDIR/cde
eot
):$PATH
#for fMRI common lib
export LD_LIBRARY_PATH=$(rmComment <<eot | tr -s ' \n' ':' 
$FMRIDIR/lib
$FMRIDIR/nifticlib/lib
$FMRIDIR/niftitools/lib
$FMRIDIR/elastix/lib
#$FMRIDIR/gdcm/lib
eot
):$LD_LIBRARY_PATH




##interactive mode
if [[ $- == *i* ]]; then
    #ITKSnap comp
    source $FMRIDIR/itksnap/c3d/share/bashcomp.sh
    #add afni auto complete
    #ahdir=`apsearch -afni_help_dir`
    ahdir=${HOME}/.afni/help
    if [ -f "$ahdir/all_progs.COMP.bash" ]; then
       . $ahdir/all_progs.COMP.bash
    fi
fi
