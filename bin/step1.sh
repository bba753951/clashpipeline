#!/bin/bash

# example
#time bash step1.sh -i SRR6512653.fastq -o pra1.csv -l 17 -a AGATCGGAAGAG

shell_folder=$(cd "$(dirname "$0")";pwd)
project_folder=$(dirname $shell_folder)
. ${shell_folder}/framefunction.sh
trim_galore=${project_folder}/TrimGalore-0.6.5/trim_galore



# check whether use options or not
# ---------------------------------------
if [ $# -lt 1 ];then
	echo "Try '$0 -h' for more information."
	exit 1
fi

# default parameter
#-----------------------------------
length=0
output="step1.csv"


# -h option
#-----------------------------------
function usage(){
cat << -EOF-
Usage: 
    $0 -i <input> -o <outfile> -l <length> -a <adaptor> 
Options:
    -h display this help and exit

    -i input file(fastq)

    -o output file(csv)
       (sequence,read count)
       default step1.csv

    -l length(greater equal)
       default 0

    -a Adaptor for trim_galore
-EOF-
exit 1
}


# get options
#-----------------------------------
while getopts ":i:o:l:a:h" opt
do
	case $opt in
		h)
			usage
			;;
        i)
            input="$(cd $(dirname $OPTARG);pwd)/$(basename $OPTARG)"
            ;;
        o)
            output="$(cd $(dirname $OPTARG);pwd)/$(basename $OPTARG)"
            ;;
        l)
            length=$OPTARG
            ;;
        a)
            trimmed_seq=$OPTARG
            ;;
		*)
			echo -e "$0: invalid option -- 'x'\nTry '$0 -h' for more information."
            exit 1
			;;
	esac
done

if [ ! $trimmed_seq ];then
    echo "you need to input '-a <adaptor>'"
    exit 1
fi

if [ ! $input ];then
    echo "you need to input '-i <input>'"
    exit 1
fi


# check file/directory exist
checkFile $input

# check the \n format,if file from dos
# use dos2unix
checkNewline $input



echo ----------parameter-----------
echo input=$input
echo output=$output
echo length=$length
echo trimmed_seq=$trimmed_seq
echo ------------------------------


# for trim_galore output file name
trimmed_input=$(basename ${input%.*})"_trimmed.fq"
echo $trimmed_input

$trim_galore --length $length --dont_gzip -a $trimmed_seq $input 
awk -f ${shell_folder}/sequence.awk $trimmed_input |sort| uniq -c |awk -v OFS="," 'BEGIN{print "sequence,read_count"}{print $2,$1}' > $output
