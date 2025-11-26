
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








