#!/bin/bash

install='debian/install'
echo -n "Creating $install: "
(find ./etc -type f; find ./usr -type f) |\
    grep -v \.git | grep -v \.travis > $install
echo "done."

cp -f LICENSE debian/copyright

dpkg-buildpackage -b -us -uc

name=`cat debian/files |grep \.deb | sed 's/ .*$//'`

# https://pmhahn.github.io/debian-oot-build/
echo "moving package file $name to current directory"
mv "../$name" .

