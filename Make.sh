#!/bin/bash

go build || {
    echo "go build failed."
    exit 2
}

go install || {
    echo "go install failed."
    exit 2
}

echo "Adding $HOME/go/bin/ to your PATH in your .bashrc ..."
if grep PATH ~/.bashrc | grep 'HOME/go/bin'  ; then
  echo "Already set, good."
else
  echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
  echo "done."
fi

exit 0
