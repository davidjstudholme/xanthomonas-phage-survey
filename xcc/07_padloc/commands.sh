
### Install and run  PADLOC
conda create -n padloc_env
conda activate padloc_env
conda install padlocbio::padloc
padloc --db-update
mkdir padloc
for i in GCA_*_genomic.fna ; do echo $i; padloc --fna $i --outdir ./padloc --cpu 12; done










