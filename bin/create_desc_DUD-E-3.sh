export PYTHONPATH=/home/dat/Apps/openbabel/lib64/python2.7/site-packages:/home/dat/WORK/dev:$PYTHONPATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dat/Apps/openbabel/lib/

python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/DUD-E/docked_by_Rognan/FGFR1/docked -P /home/dat/WORK/DB/DUD-E/docked_by_Rognan/FGFR1/protein.pdb -O DUD-E-FGFR1_SIFt_c12b0-3.csv

python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/DUD-E/docked_by_Rognan/FGFR1/docked -P /home/dat/WORK/DB/DUD-E/docked_by_Rognan/FGFR1/protein.pdb -O DUD-E-FGFR1_elementsv2_c12b0-3.csv
