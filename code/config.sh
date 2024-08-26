#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "No arguments supplied"
else
  echo "args:"
  for i in $*; do 
    echo $i 
  done
  echo ""
fi

# Inputs 
transcript=$(find -L ../data/Transcripts -name '*.fa*')
primary_assembly=$(find -L ../data/Reference -name '*.fa*')

# Parameters

if [ -z "${1}" ]; then
  num_threads=$(get_cpu_count)
else
  if [ "${1}" -gt $(get_cpu_count) ]; then
    echo "Requesting more threads than available. Setting to Max Available."
    num_threads=$(get_cpu_count)
  else
    num_threads="${1}"
  fi
fi

if [ -z "${2}" ]; then
  output_folder="salmon_transcripts_index"
else
  output_folder="${2}"
fi

if [ -z "${3}" ]; then
  echo "Using k-mer hash over k-mers of length 31"
  k_mers_length=""
else
  k_mers_length="-k ${3}"
  echo "Using k-mer hash over k-mers of length ${k_mers_length}"
fi

if [ -z "${4}" ] || [ "${4}" == "True" ]; then
  gencode="--gencode"
else
  gencode=""
fi

if [ "${5}" == "True" ]; then
  keep_duplicates="--keepDuplicates"
else
  keep_duplicates=""
fi

decoys=$(find -L ../data -name 'decoys.txt' | head -1)
gentrome=$(find -L ../data -name 'gentrome.fa.gz' | head -1)

if [[ ${transcript} != *.gz  ]]; then
  gzip -c ${transcript} > ../scratch/transcripts.fa.gz
  transcript="../scratch/transcripts.fa.gz"
fi

if [[ ${primary_assembly} != *.gz ]]; then
  gzip -c ${primary_assembly} > ../scratch/primary_assembly.fa.gz
  primary_assembly="../scratch/primary_assembly.fa.gz"
fi

if [ -z "${decoys}" ] || [ -z "${gentrome}" ]; then
  decoys="../results/decoys.txt"
  gentrome="../results/gentrome.fa.gz"
  echo "No decoys or gentrome provided. Generating from scratch"
  
  zgrep "^>" "${primary_assembly}" | cut -d " " -f 1 > "${decoys}"

  sed -i.bak -e 's/>//g' "${decoys}"
  rm -f *.bak
  cat "${transcript}" "${primary_assembly}" > "${gentrome}"
fi
