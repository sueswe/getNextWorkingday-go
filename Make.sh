#!/bin/bash

APPRELEASEVERSION=$(git rev-list -1 HEAD get_next_wd.go | cut -b 1-8)
export APPRELEASEVERSION
echo "REV: $APPRELEASEVERSION"

echo "compiling: go build runcmd.go -ldflags -X main.REV=$APPRELEASEVERSION"
go build -ldflags "-X main.REV=$APPRELEASEVERSION"  || {
    echo "Status: $?"
    exit 4
}

#go install || {
#    echo "go install failed."
#    exit 2
#}

mv -fv getNextWorkingday  $HOME/go/bin/ || {
  echo "mv failed."
  exit 3
}

echo ""
echo "Adding $HOME/go/bin/ to your PATH in your .bashrc ..."
if grep PATH ~/.bashrc | grep 'HOME/go/bin'  ; then
  echo "Already set, good."
else
  echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
  echo "done."
fi

exit 0
