#!/bin/bash


# cleanup dangling packages
set -x
osc rdelete home:hennevogel:demo hello-zagreb -m cleanup
sudo zypper rr http://download.opensuse.org/repositories/home:/hennevogel:/demo/openSUSE/
set +x
set -e

echo "Open Build Service + github demo"
read

echo -e "$ mktemp -d -p /home/hvogel/Development/Demo\n"
WORKDIR=`mktemp -d -p /home/hvogel/Development/Demo`
read

echo -e "$ cd $WORKDIR\n"
cd $WORKDIR
read

echo -e "$ git clone git@github.com:hennevogel/hello-zagreb hello-zagreb.git\n"
git clone git@github.com:hennevogel/hello-zagreb hello-zagreb.git
read

echo -e "$ cd hello-zagreb.git\n"
cd hello-zagreb.git
read

echo -e "===Let's explore the git checkout===\n"
zsh

echo -en "$ cd ..\n"
cd ..
read

echo -en "$ osc co home:hennevogel:demo\n"
osc co home:hennevogel:demo
read

echo -en "$ cd home:hennevogel:demo\n"
cd home:hennevogel:demo
read

echo -e "$ osc mkpac hello-zagreb"
osc mkpac hello-zagreb
read

echo -e "$ cd hello-zagreb\n"
cd hello-zagreb
read

echo -e "===Let's explore the OBS checkout===\n"
zsh

echo -e "$ osc add git://github.com/hennevogel/hello-zagreb.git"
osc add git://github.com/hennevogel/hello-zagreb.git
read

echo -e "$ vim _service\n"
read
vim _service

echo -e "$ osc ci -m Release-1.0"
osc ci -m Release-1.0

echo -e "===Let's explore the result===\n"
zsh

echo -e "$ osc repourls"
osc repourls
read

echo -e "$ sudo zypper ar -f https://download.opensuse.org/repositories/home:/hennevogel:/demo/openSUSE/home:hennevogel:demo.repo"
sudo zypper ar -f https://download.opensuse.org/repositories/home:/hennevogel:/demo/openSUSE/home:hennevogel:demo.repo
read

echo -e "$ sudo zypper in hello-zagreb"
sudo zypper in hello-zagreb
read

echo -e "===Let's explore the binary package===\n"
zsh

echo -e "$ cd $WORKDIR/hello-zagreb.git"
cd $WORKDIR/hello-zagreb
read

echo -e "===Let's make a new release===\n"
zsh

echo -e "$ sudo zypper up hello-zagreb"
sudo zypper up hello-zagreb
read
