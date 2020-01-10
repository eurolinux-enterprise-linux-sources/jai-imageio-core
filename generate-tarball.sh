#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "Please give your dev.java.net username on the command line."
  exit 1
fi

if [ -z "$2" ]; then
  echo "Please give the desired date on the command line."
  exit 1
fi

CVSROOT=":pserver:${1}@cvs.dev.java.net:/cvs"
MODULE=jai-imageio-core
DIR=$MODULE-cvs$2-CLEANED

if [ -e $DIR ]; then
  echo "Please remove $DIR and try again."
  exit 1
fi

cvs -d $CVSROOT -f login

echo "Checking out"
cvs -z 3 -d $CVSROOT -f export -D $2 -d $DIR $MODULE

echo "Cleaning"
cd $DIR
rm -rf LICENSE-codecLibJIIO.txt src/share/classes/jj2000 src/share/jclib4jai www
cd ..

echo "Making tarball"
find $DIR -type d -print0 | xargs -0 touch -d $2 -c
tar cJf $DIR.tar.xz $DIR --owner 0 --group 0
tar czf $DIR.tar.gz $DIR --owner 0 --group 0

echo "Cleaning up"
rm -rf $DIR

echo "Results in $DIR.tar.xz and $DIR.tar.gz"
