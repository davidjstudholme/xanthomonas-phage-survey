ln -s ../01_genomes/*.fasta .

### Install and run geNomad
conda create -n genomad_env
conda activate genomad_env
conda install bioconda::genomad
genomad download-database .
for i in *.fasta ; do echo $i; genomad end-to-end --cleanup --splits 8 $i . genomad_db; done










