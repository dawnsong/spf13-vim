# .bash_profile

# User specific environment and startup programs
function importrc(){ test -f "$1" && source "$1" ; }

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    importrc "$HOME/.bashrc"
fi

export EDITOR=vi

export PATH=$(tr -s ' \n' ':' <<eot
$HOME/bin 
$HOME/dawn/bin 
$HOME/dawn/bin/fred.imagemagick.scripts
/bin 
/sbin  
/usr/bin 
/usr/sbin 
eot
):$PATH
export LD_LIBRARY_PATH=$(tr -s ' \n' ':' <<eot
$HOME/lib
/usr/lib 
/usr/lib64/
/usr/local/lib
/lib
eot
):$LD_LIBRARY_PATH

#dawnsong Env config
TIME_LOGIN=`date`

if [[ ! -z $DAWNBIND ]]; then export PATH=$DAWNBIND:$PATH; fi

host=${HOSTNAME:-$(uname -n)}
if [[ $host =~ ^q ]]; then importrc $HOME/.bash_quest; fi
if [[ $host =~ ^p ]]; then importrc $HOME/.bash_biowulf.nih.gov; fi
if [[ $host =~ ^cn ]]; then importrc $HOME/.bash_biowulf2.nih.gov; fi

importrc $HOME/.bash_${host}
importrc $HOME/fmri/fmri.bashrc

#importrc "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

importrc $HOME/.bash_nidamac

#assure my profile is loaded at the very end
importrc $HOME/.bash_dawnfunc


