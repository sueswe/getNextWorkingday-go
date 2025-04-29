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

# remotecommander.rb -g stp,testta3 -c "mkdir \$HOME/bin"
cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh stp,testta3 getNextWorkingday \$HOME/bin/ || {
    echo "Status: $?"
    exit 2
}

# remotecommander.rb -g lgkk,testta3 -c "mkdir \$HOME/bin"
cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh lgkk,testta3 getNextWorkingday \$HOME/bin/ || {
    echo "Status: $?"
    exit 2
}


# remotecommander.rb -g lgkk,prodta3 -c "mkdir \$HOME/bin"
cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh lgkk,prodta3 getNextWorkingday \$HOME/bin/ || {
    echo "Status: $?"
    exit 2
}

# remotecommander.rb -g stp,prodta3 -c "mkdir \$HOME/bin"
cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh stp,prodta3 getNextWorkingday \$HOME/bin/ || {
    echo "Status: $?"
    exit 2
}



echo '
### AIX ###############################################################
'

# remotecommander.rb -g stp,testta2 -c "mkdir \$HOME/bin"
cd /tmp/ || exit 1
"$HOME"/bin/vicecersa.sh stp,testta2 getNextWorkingday.aix \$HOME/bin/ || {
    echo "Status: $?"
    exit 2
}
remotecommander.rb -g stp,testta2 -c "mv \$HOME/bin/getNextWorkingday.aix \$HOME/bin/getNextWorkingday"

