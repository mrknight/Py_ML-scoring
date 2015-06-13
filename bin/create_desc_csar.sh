export PYTHONPATH=/home/dat/Apps/openbabel/lib64/python2.7/site-packages:/home/dat/WORK/dev:$PYTHONPATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dat/Apps/openbabel/lib/

python csar.py -B 12 -O CSARset1_sybyl_c12b12.csv -D sybyl
python csar.py -B 12 -O CSARset1_elements_c12b12.csv -D elements
python csar.py -B 4.5 -O CSARset1_credo_c12.csv -D credo
#python csar.py -B 12 -O CSARset2_sybyl_c12b12.csv -D sybyl
#python csar.py -B 12 -O CSARset2_elements_c12b12.csv -D elements
#python csar.py -B 4.5 -O CSARset2_credo_c12.csv -D credo

python csar.py -B 1 -O CSARset1_sybyl_c12b1.csv -D sybyl
python csar.py -B 1 -O CSARset1_elements_c12b1.csv -D elements
python csar.py -B 1 -O CSARset1_credo_c12b1.csv -D credo
#python csar.py -B 1 -O CSARset2_sybyl_c12b1.csv -D sybyl
#python csar.py -B 1 -O CSARset2_elements_c12b1.csv -D elements
#python csar.py -B 1 -O CSARset2_credo_c12b1.csv -D credo

python csar.py -B 2 -O CSARset1_sybyl_c12b2.csv -D sybyl
python csar.py -B 2 -O CSARset1_elements_c12b2.csv -D elements
python csar.py -B 2 -O CSARset1_credo_c12b2.csv -D credo
#python csar.py -B 2 -O CSARset2_sybyl_c12b2.csv -D sybyl
#python csar.py -B 2 -O CSARset2_elements_c12b2.csv -D elements
#python csar.py -B 2 -O CSARset2_credo_c12b2.csv -D credo
