clash analysis pipeline
===
###### tags:`lab project`
[TOC]


# Prerequisites
This program need to use "trim_galore","bowtie","RNAup","RNAfold" program.

You can choose one of following options to intall these programs.
## 1. Install from script
```shell=
bash INSTALL.sh
```
## 2. Install by docker 
ubuntu:16.04
- docker pull
```shell=
docker pull bba753951/clashpipeline:v10
```


## 3. Install by yourself

### Install trim_galore
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


### Install bowtie


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
export PATH=$PATH:$HOME/bowtie-1.0.0
```
4. Don't forget to source file or start a new terminal
```shell=
source ~/.profile
```
5. Test the installation is success or not
```shell=
bowtie -h
```


### Install RNAup/RNAfold (two method)

[ViennaRNA Package](https://www.tbi.univie.ac.at/RNA/index.html)
[ViennaRNA Install](https://www.tbi.univie.ac.at/RNA/documentation.html#install)
#### 1.use dpkg
- download .deb file
![](https://i.imgur.com/RYTUObe.png)

- Install by dpkg
```shell=
dpkg -i viennarna_2.4.14-1_amd64.deb
```

#### 2.Compile from Source Code
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

# Usage
1. unzip the package 
2. add the {path_to_clashpipeline/bin} to your path
3. try "pipeline -h" 
4. must have option
```shell=
pipeline -f <fastqfile> -t <transcript file> -r <regulator file> -g <gene to transcript file> -a <adaptor>
```

## Options



* -h display this help and exit

* -f hybrid file(fastq)

* -t transcript file(csv)
   (must have "transcript_name" or "sequence" column name)

* -r regulator file(csv)
   (must have "regulator_name" or "sequence" column name)

* -g Gene to transcript file(csv)
   (must have "transcript_name" or "Gene_name" column name)

* -a adaptor sequence
   (for trim_galore parameter)

* -o output file name
   (will have following output)
   outfile,
   OUTPUT_hybrid_transcript.csv
   OUTPUT_regulator_transcript.csv,
   OUTPUT_transcript_regulator.csv,
   OUTPUT_gene.csv(if you use -g \<gene to transcript file>)
   default output.csv

* -l select hybrid read length(greater equal)
   (for trim_galore parameter)
   default 0

* -L select remaining sequence length(greater equal)
   default 0

* -C select hybrid read count(greater equal)
   (must have "read_count" column name)
   default None

* -G you will use "GU targeting algorithm" and select "GU_targeting_score"(greater equal)
   "GU targeting algorithm" only for "==regulator = piRNA==" or "==regulator sequence length=21=="
   if you want to use this option,make sure you have already installed "==python==3"
   (inclue "==numpy==" and "==pandas==")
   default None

* -U select "RNAup_score" (less equal)
   default None

* -F select "RNAfold_MFE" (less equal)
   default None

* -b use bowtie build or not
   (for hybrid build reference)
   1 for use,0 for not use
   default 1

* -B use bowtie build or not
   (for transcript build reference)
   1 for use,0 for not use
   default 1

* -m mismatch count for "regulator to hybrid"
   (you can only use 0,1,2)
   default 0

* -M mismatch count for "remaining to transcript"
   (you can only use 0,1,2)
   default 0

* -p use parallel to increase speed.
   if you want to use this option,make sure you have already installed "==parellel=="
   sudo apt-get install parallel
   1 for use,0 for not use
   default 1

