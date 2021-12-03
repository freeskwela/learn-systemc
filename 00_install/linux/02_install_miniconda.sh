#!/bin/bash

export SCRIPTDIR=$(dirname $(realpath $BASH_SOURCE))

# project folder
cd $SCRIPTDIR && cd ../..
export PROJECTDIR=$(pwd)

# create a build folder
cd $SCRIPTDIR
if test ! -d ".build"; then
    mkdir .build
fi

# work inside build folder
cd .build

# miniconda installer filename
export CONDA_INST="miniconda64.sh"

if test ! -f "$CONDA_INST"; then
    # download latest version of Miniconda
    printf "\\n"
    printf "Download latest version of Miniconda for Linux 64-bit\\n"
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $CONDA_INST   
fi

# install Miniconda
printf "\\n"
printf "Launch installer script\\n"

conda_file=$(which conda)
if [ ! -f "$conda_file" ]; then
    bash $CONDA_INST
else
    printf "conda already installed\\n"
fi

# options
printf "\\n"
printf "Post Installation :: User Options\\n"
printf "************************************************************\\n"
printf " - to initialize conda variables\\n"
printf "\\t command: source ~/.bashrc\\n"
printf " - to check conda installation directory\\n"
printf "\\t command: conda info --base\\n"
printf "\\t command: source ~/devtools/miniconda/etc/profile.d/conda.sh"
printf " - to disable conda 'base' environment auto-activation\\n"
printf "\\t command: conda config --set auto_activate_base false && source ~/.bashrc\\n"

printf "\\n"
printf "Cleaning :: Miniconda Installer \\n"
printf "************************************************************\\n"
rm -rf $CONDA_INST

cd $PROJECTDIR
