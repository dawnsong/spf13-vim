#!/bin/bash 


export HCPPATH4WB=${HCPPATH4WB:-$FMRIDIR/hcp.workbench}
if [ -d $HCPPATH4WB ]; then 
    export PATH=$HCPPATH4WB/bin_linux64:$PATH
    source $HCPPATH4WB/exe_linux64/bashcomplete_wb_shortcuts
    source $HCPPATH4WB/exe_linux64/bashcomplete_wb_command
fi
