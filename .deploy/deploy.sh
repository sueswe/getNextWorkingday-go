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

stages='
stp,testta3
stp,prodta3
lgkk,testta3
lgkk,prodta3
'

for umg in $stages; do
    cd /tmp/ || exit 1
    "$HOME"/bin/vicecersa.sh ${umg} getNextWorkingday \$HOME/bin/ || {
        echo "Status: $?"
        exit 2
    }
done


echo '
### AIX ###############################################################
'

stages='
stp,testta2
stp,prodta2
'

for umg in ${stages}; do
    cd /tmp/ || exit 1
    "$HOME"/bin/vicecersa.sh ${umg} getNextWorkingday.aix \$HOME/bin/ getNextWorkingday || {
        echo "Status: $?"
        exit 2
    }
done
