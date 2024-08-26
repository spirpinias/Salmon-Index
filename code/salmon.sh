#!/usr/bin/env bash

set -ex

source ./config.sh

salmon index \
    --threads "${num_threads}" \
    -t "${gentrome}" \
    --decoys "${decoys}" \
    ${k_mers_length} \
    -i ../results/${output_folder} \
    ${gencode} \
    ${keep_duplicates}
