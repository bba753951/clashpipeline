clash analysis pipeline
===
###### tags:`lab project`
[TOC]

# Prerequisites
This program need to use "trim_galore","bowtie","RNAup","RNAfold" program.

You can choose one of following options to intall these programs.
## 1. Install from script
```shell=
./INSTALL.sh
```
## 2. Install by docker 
ubuntu:16.04
- docker pull
```shell=
docker pull bba753951/clashpipeline:v10
```


## 3. Install by yourself
See Install_By_Yourself.md detail


# Usage
1. unzip the package 
2. add the {path_to_clashpipeline/bin} to your PATH
3. try "pipeline -h" 
4. must have option
```shell=
pipeline -f <fastqfile> -t <transcript file> -r <regulator file> [OPTIONS] 
```

## Options
*    -h display this help and exit

*    -f (must use) hybrid file(fastq)

*    -t (must use) transcript file(csv)
       (must have "transcript_name" and "sequence" column name)

*    -r (must use) regulator file(csv)
       (must have "regulator_name" and "sequence" column name)

*    -g Gene to transcript file(csv)
       (must have "transcript_name" and "Gene_name" column name)

*    -a adaptor sequence(for trim_galore parameter)
       If not specified,trim_galore will auto detect.

*    -o output file name
       (will have following output)
       outfile,
       OUTPUT_hybrid_transcript.csv,
       OUTPUT_regulator_transcript.csv,
       OUTPUT_transcript_regulator.csv,
       OUTPUT_gene.csv(if you use -g \<gene to transcript file>),
       default output.csv

*    -l select hybrid read length(greater equal)
       (for trim_galore parameter)
       default 17

*    -L select remaining sequence length(greater equal)
       default 15

*    -C select hybrid read count(greater equal)
       (must have "read_count" column name)
       default None

*    -G you will use "GU targeting algorithm" and select "GU_targeting_score"(greater equal)
       "GU targeting algorithm" only for "regulator = piRNA" or "regulator sequence length=21"
       if you want to use this option,make sure you have already installed "python3"
       (inclue "numpy" and "pandas")
       default None

*    -U select "RNAup_score" (less equal)
       default None

*    -F select "RNAfold_MFE" (less equal)
       default None

*    -b use bowtie build or not
       (for hybrid build reference)
       1 for use,0 for not use
       default 1

*    -B use bowtie build or not
       (for transcript build reference)
       1 for use,0 for not use
       default 1

*    -m mismatch count for "regulator to hybrid"
       (you can only use 0,1,2)
       default 0

*    -M mismatch count for "remaining to transcript"
       (you can only use 0,1,2)
       default 0

*    -p use parallel to increase speed.
       if you want to use this option,make sure you have already installed "parallel"
       sudo apt-get install parallel
       1 for use,0 for not use
       default 0
