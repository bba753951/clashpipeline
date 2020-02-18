#!/bin/bash



shell_folder=$(cd "$(dirname "$0")";pwd)

echo $PATH|grep "\.local/bin:"
if [ "$?" = "1" ];then
    echo add $HOME/.local/bin to PATH
    export PATH=$HOME/.local/bin:$PATH
    echo 'export PATH=$HOME/.local/bin:$PATH' >> $HOME/.profile
    source $HOME/.profile
fi


if [ ! -d "$HOME/.local/bin"  ] ; then
    mkdir -p $HOME/.local/bin
fi

# wget
if [ ! -x "$(which wget)" ]; then
    echo "you need to install wget"
    echo 'try "sudo apt-get install wget"'
    exit 1
fi

# wget
if [ ! -x "$(which zip)" ]; then
    echo "you need to install zip"
    echo 'try "sudo apt-get install zip"'
    exit 1
fi

# pip
if [ -x "$(which pip)" ]; then
    echo "pip is already installed"
else
    echo "install pip"
    wget -O get-pip.py https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    if [ ! -x "$(which pip)" ]; then
        echo you need to install pip by yourself
        exit 1
    fi

fi

# cutadapt
if [ -x "$(which cutadapt)" ]; then
    echo "cutadapt is already installed"
else
    echo "install cutadapt"
    pip install cutadapt --user
    if [ ! -x "$(which cutadapt)" ]; then
        echo you need to install cutadapt by yourself
        exit 1
    fi
fi


# trim_galore
if [ -x "$(which trim_galore)" ]; then
    echo "trim_galore is already installed"
else
    echo "install trim_galore"
    wget -O trim_galore.tar.gz https://github.com/FelixKrueger/TrimGalore/archive/0.6.5.tar.gz
    tar xvzf trim_galore.tar.gz
    echo "export PATH=${shell_folder}/TrimGalore-0.6.5:"'$PATH' >> $HOME/.profile
    source $HOME/.profile

    if [ ! -x "$(which trim_galore)" ]; then
        echo you need to install trim_galore by yourself
        exit 1
    fi
fi

# python
if [ -x "$(which python)" ]; then
    echo "python is already installed"
else
    echo "you need to install python for using bowtie"
    echo "And re-run INSTALL.sh"
    exit 1
fi


# bowtie
if [ -x "$(which bowtie)" ]; then
    echo "bowtie is already installed"
else
    echo "install bowtie"
    wget -O bowtie-1.2.3-linux-x86_64.zip https://sourceforge.net/projects/bowtie-bio/files/bowtie/1.2.3/bowtie-1.2.3-linux-x86_64.zip/download
    unzip bowtie-1.2.3-linux-x86_64.zip 
    echo "export PATH=${shell_folder}/bowtie-1.2.3-linux-x86_64:"'$PATH' >> $HOME/.profile
    source $HOME/.profile

    if [ ! -x "$(which bowtie)" ]; then
        echo you need to install bowtie by yourself
        exit 1
    fi
fi


# gcc
if [ -x "$(which gcc)" ]; then
    echo "gcc is already installed"
else
    echo "you need to install gcc for compile ViennaRNA package"
    echo "And re-run INSTALL.sh"
    exit 1
fi


# viennaRNA
if [ -x "$(which RNAup)" ]; then
    echo "viennaRNA is already installed"
else
    echo "install viennaRNA"
    wget -O ViennaRNA-2.4.14.tar.gz https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.14.tar.gz
    tar xvzf ViennaRNA-2.4.14.tar.gz
    cd ViennaRNA-2.4.14
    ./configure --prefix=${shell_folder}/ViennaRNA
    make install
    echo "export PATH=${shell_folder}/ViennaRNA/bin:"'$PATH' >> $HOME/.profile
    source $HOME/.profile

    if [ ! -x "$(which RNAup)" ]; then
        echo you need to install ViennaRNA by yourself
        exit 1
    fi
fi

echo 'Please run "source ~/.profile" to source your profile'
echo "(press any key to continue...)"
read -n 1 key; echo
