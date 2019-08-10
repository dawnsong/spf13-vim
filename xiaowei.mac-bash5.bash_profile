
#alias for ls
alias ls='ls --color=auto -tr' #gnu coreutils
alias ll='ls --color=auto -ltr'
#mac's ls 2002
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#for bash #default='\h:\W \u\$ '
#all color codes should be surronded with \[ and \] 
#otherwise, iterm may not treat long line input well!
#https://superuser.com/questions/207298/mac-terminal-iterm-history-cursor-problems
cMagneta=$(tput setaf 5)
cCyan=$(tput setaf 6)
cLightBlue="\033[01;34m"
cReset=$(tput sgr0)
export PS1="\[$cLightBlue\]\h:\[$cCyan\]\w$ \[$cReset\]"

#env
export LOCATE_PATH=/Users/songx4/var/locate/locate.db
export LOCATE_CONFIG=/Users/songx4/etc/locate.rc

export PATH=$(tr -s ' \n' ':' <<eot
$HOME/bin/
$HOME/dawn/bin/
/Applications/anaconda3/bin/
/usr/local/opt/coreutils/libexec/gnubin/
/usr/local/opt/ruby/bin/
/usr/local/opt/icu4c/bin
/usr/local/opt/icu4c/sbin
/usr/local/texlive/2019/bin/x86_64-darwin/
/Applications/workbench/bin_macosx64
eot
):$PATH


#for development
export xLDFLAGS=$(tr -s ' \n' ':' <<eot

/usr/local/opt/gettext/lib
/usr/local/opt/readline/lib
/usr/local/opt/ruby/lib
/usr/local/opt/icu4c/lib
eot
)
export LDFLAGS="$(echo $xLDFLAGS|sed -e 's/:$//' -e 's/:/  -L/g') $LDFLAGS"

export xCPPFLAGS=$(tr -s ' \s' ':' <<eot

/usr/local/opt/gettext/include
/usr/local/opt/readline/include
/usr/local/opt/ruby/include
/usr/local/opt/icu4c/include
eot
)
export CPPFLAGS="$(echo $xCPPFLAGS|sed -e 's/:$//' -e 's/:/  -I/g') $CPPFLAGS"


#for gnu tools
export MANPATH=$(tr -s '\n' ':' <<eom
/usr/local/opt/coreutils/libexec/man
/usr/local/opt/gawk/share/man
/usr/local/man 
/usr/local/share/man
$MANPATH
eom
)

#for bash-completion@2 >=4
#[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
#If you'd like to use existing homebrew v1 completions, add the following before the previous line
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"




# FSL Setup
FSLDIR=/Users/songx4/fmri/fsl
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH
. ${FSLDIR}/etc/fslconf/fsl.sh

#FreeSurfer 
export FREESURFER_HOME=/Applications/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh



