#!/bin/bash

source ~/.profile

cd "$HOME"/compile/getNextWorkingday-go || {
    echo "Status: $?"
    exit 4
}

echo "------------------------------------"
env | grep PATH
env | grep LOADED
pwd
echo "------------------------------------"

APPRELEASEVERSION=$(git rev-list -1 HEAD get_next_wd.go)
export APPRELEASEVERSION
echo "REV: $APPRELEASEVERSION"

echo ""
echo "compiling: go build get_next_wd.go -ldflags -X main.REV=$APPRELEASEVERSION"
go build -ldflags "-X main.REV=$APPRELEASEVERSION" -v -o /tmp/getNextWorkingday || {
    echo "Status: $?"
    exit 4
}

echo ""
echo "compiling: GOOS=aix GOARCH=ppc64 go build get_next_wd.go -ldflags -X main.REV=$APPRELEASEVERSION"
GOOS=aix GOARCH=ppc64 go build -ldflags "-X main.REV=$APPRELEASEVERSION" -v -o /tmp/getNextWorkingday.aix || {
    echo "Status: $?"
    exit 4
}
