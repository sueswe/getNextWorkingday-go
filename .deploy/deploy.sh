#!/bin/bash

source ~/.profile

cd "$HOME"/compile/runcmd-go || {
    echo "Status: $?"
    exit 4
}

echo "------------------------------------"
env | grep PATH
env | grep LOADED
echo "------------------------------------"


echo '
### LINUX ###############################################################
'
cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh stp,testta3 getNextWorkingday \$HOME/bin || {
    echo "Status: $?"
    exit 2
}

cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh lgkk,testta3 getNextWorkingday \$HOME/bin || {
    echo "Status: $?"
    exit 2
}

cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh stp,testta3 getNextWorkingday \$HOME/bin || {
    echo "Status: $?"
    exit 2
}

cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh lgkk,prodta3 getNextWorkingday \$HOME/bin || {
    echo "Status: $?"
    exit 2
}

cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh stp,prodta3 getNextWorkingday \$HOME/bin || {
    echo "Status: $?"
    exit 2
}



echo '
### AIX ###############################################################
'

cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh stp,testta2 getNextWorkingday.aix \$sBATCH_STP_HOME/getNextWorkingday || {
    echo "Status: $?"
    exit 2
}

cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh stp,prodta2 getNextWorkingday.aix \$sBATCH_STP_HOME/getNextWorkingday || {
    echo "Status: $?"
    exit 2
}
