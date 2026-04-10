ln -s ../01_genomes/*.fasta .

### Install and run Defense-finder
conda create -n defense-finder_env
conda activate defense-finder_env
conda install defense-finder
defense-finder update
for i in *.fasta ; do echo $i; defense-finder run $i --out-dir .; done









