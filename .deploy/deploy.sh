#!/bin/bash

source ~/.profile

cd "$HOME"/compile/getNextWorkingday-go || {
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

stages='stplgk,testta3 stp,testta3 stp,prodta3 lgkk,testta3 lgkk,prodta3 hema,test,01T hema,prod'
for umg in $stages; do
    cd /tmp/ || exit 1
    "$HOME"/bin/vicecersa.sh ${umg} getNextWorkingday '~/bin/' || {
        echo "Status: $?"
        exit 2
    }
    echo ""
done


echo '
### AIX ###############################################################
'

stages="stp,testta2 stp,prodta2 pfif"
for umg in ${stages}; do
    cd /tmp/ || exit 1
    "$HOME"/bin/vicecersa.sh ${umg} getNextWorkingday.aix '~/bin/' getNextWorkingday || {
        echo "Status: $?"
        exit 2
    }
    echo ""
done
