### Download NCBI's datasets utility:
curl -o datasets 'https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/LATEST/linux-amd64/datasets'
chmod u+x datasets

### Use NCBI's datasets utility to download the genome sequences, unzip them and make symlinks in curren directory:
./datasets download genome accession --inputfile assm_accs.txt --include genome --filename genome_assemblies.zip
unzip genome_assemblies.zip
ln -s ncbi_dataset/data/GCA_*/GCA_*.fna
rm README.md

### Install and run  PADLOC
conda create -n padloc_env
conda activate padloc_env
conda install padlocbio::padloc
padloc --db-update
mkdir padloc
for i in GCA_*_genomic.fna ; do echo $i; padloc --fna $i --outdir ./padloc --cpu 12; done

### Install and run Defense-finder
conda create -n defense-finder_env
conda activate defense-finder_env
conda install defense-finder
defense-finder update
mkdir defense-finder
for i in GCA_*_genomic.fna ; do echo $i; defense-finder run $i --out-dir defense-finder; done

### Install and run Phigaro
conda create -n phigaro_env
conda activate phigaro_env
conda install bioconda::phigaro
phigaro-setup --no-updatedb
for i in GCA_*_genomic.fna ; do echo $i; phigaro -f $i -o ./phigaro -p --not-open -d -e html tsv gff bed stdout; done

### Install PhiSpy
conda create -n phispy_env
conda activate phispy_env
conda install -c bioconda phispy
### Requires input genomes as GenBank files !!!


### Install PhageBoost
conda create -y -n phageboost_env python=3.11 # python 3.9 - 3.12 should work
conda activate phageboost_env 
git clone https://github.com/ku-cbd/PhageBoost.git
cd PhageBoost/ 
python setup.py bdist_wheel
pip install --user .
cd -
./PhageBoost/PhageBoost -h
### Does not work !!!

### Install PhageBoost by alternative method
conda create -y -n phageboost_env python=3.7 
conda activate phageboost_env
pip install PhageBoost 
PhageBoost -h
### Gives error message: ImportError: cannot import name 'Literal' from 'typing' (/data/djs217/miniconda3/envs/phageboost_env/lib/python3.7/typing.py)

### Install PhageBoost by alternative method
conda create -y -n phageboost_env python=3.8 
conda activate phageboost_env
pip install PhageBoost 
PhageBoost -h
### Gives error message: ModuleNotFoundError: No module named 'Bio.SeqUtils.CodonUsage'

### Install and run geNomad
conda create -n genomad_env
conda activate genomad_env
conda install bioconda::genomad
genomad download-database .
for i in GCA_*_genomic.fna ; do echo $i; genomad end-to-end --cleanup --splits 8 $i genomad genomad_db; done

### Install VirFinder
conda create -n virfinder_env
conda activate virfinder_env
conda install bioconda::r-virfinder
### Now we can execute virfinder from within an R shell:
### library(VirFinder)
### predResult <- VF.pred(<path_to_the_fasta_file>)

### DeepVirFinder
conda create --name deepvirfinder_env python=3.6 numpy theano=1.0.3 keras=2.2.4 scikit-learn Biopython h5py=2.10.0 mkl-service=2.4.0
conda activate deepvirfinder_env
git clone https://github.com/jessieren/DeepVirFinder
for i in GCA_*_genomic.fna ; do echo $i; python DeepVirFinder/dvf.py -i $i -o ./deepvirfinder/ -l 1000; done









