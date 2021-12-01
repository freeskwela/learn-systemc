#!/bin/bash

export SCRIPTDIR=$(dirname $(realpath $BASH_SOURCE))

# project folder
cd $SCRIPTDIR && cd ../..
export PROJECTDIR=$(pwd)

printf "\\n"

conda_file=$(which conda)
if [ ! -f "$conda_file" ]; then
    printf "conda not installed\\n"
else
    read -p "Enter environment name: " env_name
    read -p "Enter python version: " py_version
    conda create -n $env_name python=$py_version
fi
