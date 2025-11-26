
### DeepVirFinder
conda create --name deepvirfinder_env python=3.6 numpy theano=1.0.3 keras=2.2.4 scikit-learn Biopython h5py=2.10.0 mkl-service=2.4.0
conda activate deepvirfinder_env
git clone https://github.com/jessieren/DeepVirFinder
for i in GCA_*_genomic.fna ; do echo $i; python DeepVirFinder/dvf.py -i $i -o ./deepvirfinder/ -l 1000; done









