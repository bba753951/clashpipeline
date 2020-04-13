Install by yourself
===
###### tags:`lab project`
[TOC]


## Install trim_galore
[trim_galore](https://github.com/FelixKrueger/TrimGalore#installation)
1. if you want to use trim_galoe,you need to have **cutadapt**
```shell=
# Check that cutadapt is installed
cutadapt --version

# use pip to install 
pip install cutadapt
```

2. Install trim_galore
```shell=
# Install Trim Galore
curl -fsSL https://github.com/FelixKrueger/TrimGalore/archive/0.6.5.tar.gz -o trim_galore.tar.gz
tar xvzf trim_galore.tar.gz
```
3. add to your **PATH**
    - example(ubuntu)
```shell=
# add the path to ~/.profile
export PATH=$PATH:{path_to_your_TrimGalore_file}
# example
export PATH=$PATH:$HOME/TrimGalore-0.6.5
```
4. Don't forget to source file or start a new terminal
```shell=
source ~/.profile
```
5. Test the installation is success or not
```shell=
trim_galore --help
```


## Install bowtie


1. choose one version and download zip file from [here](https://sourceforge.net/projects/bowtie-bio/files/bowtie/)
2. unzip the zip file
```shell=
unzip {zip_file}
```
3. add to your **PATH**
    - example(ubuntu)
```shell=
# add the path to ~/.profile
export PATH=$PATH:{path_to_your_bowtie_file}
# example
export PATH=$PATH:$HOME/bowtie-1.2.3-linux-x86_64
```
4. Don't forget to source file or start a new terminal
```shell=
source ~/.profile
```
5. Test the installation is success or not
```shell=
bowtie -h
```


## Install RNAup/RNAfold (two method)

[ViennaRNA Package](https://www.tbi.univie.ac.at/RNA/index.html)
[ViennaRNA Install](https://www.tbi.univie.ac.at/RNA/documentation.html#install)
### 1.use dpkg
- download .deb file
![](https://i.imgur.com/RYTUObe.png)

- Install by dpkg
```shell=
dpkg -i viennarna_2.4.14-1_amd64.deb
```

### 2.Compile from Source Code
1. download source code
```shell=
tar -zxvf ViennaRNA-2.4.4.tar.gz

cd ViennaRNA-2.4.4

#(this step need gcc compiler)
./configure --prefix=/home/username/ViennaRNA
make install
```


2. add to your **PATH**(path to bin file)
    - example(ubuntu)
```shell=
# add the path to ~/.profile
export PATH=$PATH:{path_to_your_ViennaRNA_package_bin}
# example
export PATH=$PATH:$HOME/ViennaRNA/bin/
```
3. Don't forget to source file or start a new terminal
```shell=
source ~/.profile
```

4. Test the installation is success or not
```shell=
RNAup
# Input string (upper or lower case); @ to quit
# ....,....1....,....2....,....3....,....4....,....5....,....6....,....7....,....8
```