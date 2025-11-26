ln -s ../01_genomes/*.fasta .

### Install and run Phigaro
conda create -n phigaro_env
conda activate phigaro_env
conda install bioconda::phigaro
phigaro-setup --no-updatedb
for i in *.fasta ; do echo $i; phigaro -f $i -o ./phigaro -p --not-open -d -e html tsv gff bed stdout; done











