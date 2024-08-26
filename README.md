[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# Indexing for Mapping Based Quantification

Salmon has two modes, one works on aligned reads and one which works directly on fastqs. This capsule is intended for when you wish to run with unmapped reads and output an index for direct quantification. 

## Input Data

**Genome Fasta**

Genome for the particular organism being used (DNA sequence). If a genome is not specified, any file matching \*.genome\*.fa\* in the **data** directory is used. 

**Transcript Fasta**

Transcriptome for the particular organism being used (RNA transcripts). If a transcriptome is not specified any file matching \*transcripts\*.fa\* is used. 

**Decoy.txt and gentrome.fa.gz**

There are two main ways to generate decoys for Salmon. The first is by generating random sequences from a hard masked version of the organism's genome, the second is to just include the entire genome as a decoy sequence (see [documentation](https://salmon.readthedocs.io/en/latest/salmon.html#preparing-transcriptome-indices-mapping-based-mode)). In this capsule we use the latter method. **decoy.txt** contains the chromosome names for the input genome and **gentrome.fa.gz** contains a concatenated file of the transcripts and genome. If these files are available in the **data** directory, they are not generated from scratch. This may be preferable since concatenating the transcript and genome together can be time consuming. 

## App Panel Parameters

Threads
- Total threads used by Salmon. If not specified, all available will be used. 

Output folder
- Output folder for index. Should be located in **results**.

Transcripts reference
- Fasta of all transcripts. 

Genome primary assembly reference
- Genome reference, use the same reference as transcripts.

Kmers length
- Length of sequence to identify transcripts in reads. Longer is more strict. (--kmerLen)

Gencode Format
- This flag will expect the input transcript fasta to be in GENCODE format, and will split the transcript name at the first '|' character (--gencode) (Default: True)

Keep Duplicates
- Duplicate transcripts that appear in the input will be retained and quantified separately. (--keepDuplicates) (Default: False)

## Outputs

**output_folder**: Output Salmon index
- **complete_ref_lens.bin**
- **ctable.bin**
- **ctg_offsets.bin**
- **duplicate_clusters.tsv**
- **info.json**
- **mphf.bin**
- **pos.bin**
- **pre_indexing.log**
- **rank.bin**
- **refAccumLengths.bin**
- **reflengths.bin**
- **refseq.bin**
- **seq.bin**
- **versionInfo.json**

**decoys.txt**: Decoys used in Salmon index (only if not found in **data** before run)
**gentrome.fa.gz**: Input fasta used for index generation, usually (only if not found in **data** before run)

## Source

https://salmon.readthedocs.io/en/latest/salmon.html

## Cite

Roberts, Adam, and Lior Pachter. “Streaming fragment assignment for real-time analysis of sequencing experiments.” Nature Methods 10.1 (2013): 71-73.

Roberts, Adam, et al. “Improving RNA-Seq expression estimates by correcting for fragment bias.” Genome Biology 12.3 (2011): 1.

Patro, Rob, et al. “Salmon provides fast and bias-aware quantification of transcript expression.” Nature Methods (2017). Advanced Online Publication. doi: 10.1038/nmeth.4197..

Love, Michael I., Hogenesch, John B., Irizarry, Rafael A. “Modeling of RNA-seq fragment sequence bias reduces systematic errors in transcript abundance estimation.” Nature Biotechnology 34.12 (2016). doi: 10.1038/nbt.368.2..

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)
