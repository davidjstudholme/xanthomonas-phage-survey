ln -s ../01_genomes/*.fasta .

### Install and run  PADLOC
conda create -n padloc_env
conda activate padloc_env
conda install padlocbio::padloc
padloc --db-update

for i in *.fasta ; do echo $i; padloc --fna $i --outdir . --cpu 12; done










