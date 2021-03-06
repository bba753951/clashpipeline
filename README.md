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
See Install_By_Yourself detail


# Usage
1. unzip the package 
2. add the {path_to_clashpipeline/bin} to your PATH
3. try "pipeline -h" 
4. must have option
```shell=
pipeline -f <fastqfile> -t <transcript file> -r <regulator file> 
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
       OUTPUT_hybrid_transcript.csv
       OUTPUT_regulator_transcript.csv,
       OUTPUT_transcript_regulator.csv,
       OUTPUT_gene.csv(if you use -g \<gene to transcript file>)
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
       if you want to use this option,make sure you have already installed "parellel"
       sudo apt-get install parallel
       1 for use,0 for not use
       default 0

## Use Example Data to Run
1. download example data from [here](http://cosbi7.ee.ncku.edu.tw/master_project/master_media/usage_example.zip)

2. unzip the usage_example.zip
3. run program
```shell=
pipeline -r reg_file.csv -f hyb_file.fastq -t tran_file.csv
```
### Output File Format
For example: you use -o output.csv 

1. output.csv
2. output_hybrid_transcript.csv
    > hybrid_seq,transcript_sum,transcript_name
3. output_regulator_transcript.csv
    > regulator_name,transcript_sum,transcript_name
4. output_transcript_regulator.csv
    > transcript_name,regulator_sum,regulator_name
5. output_gene.csv
    >Gene_name,counts_of_transcripts,transcript_name,counts_of_r    egulators,regulator_name


trim_galore info
1. hyb_file_trimmed.fq
2. hyb_file.fastq_trimming_report.txt

directory
1. bowtieFile
    to store the bowtie result and reference
2. idFile
    to store id name(we created)
