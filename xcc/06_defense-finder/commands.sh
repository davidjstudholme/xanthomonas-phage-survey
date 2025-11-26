

### Install and run Defense-finder
conda create -n defense-finder_env
conda activate defense-finder_env
conda install defense-finder
defense-finder update
mkdir defense-finder
for i in GCA_*_genomic.fna ; do echo $i; defense-finder run $i --out-dir defense-finder; done









