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
    printf "************************************************************\\n"
    read -p "Enter environment name: " env_name
    read -p "Enter python version: " py_version
    conda create -n $env_name python=$py_version

    printf "Post Installation :: User Options\\n"
    printf "************************************************************\\n"
    printf " - to activate your Python environment\\n"
    printf "\\t command: conda activate $env_name\\n"
    printf " - to initialize conan variables\\n"
    printf "\\t command: source ~/.profile\\n"
    printf " - to check conan installation\\n"
    printf "\\t command: conan --version\\n"
fi
