export PYTHONPATH=/home/dat/Apps/openbabel/lib64/python2.7/site-packages:/home/dat/WORK/dev:$PYTHONPATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dat/Apps/openbabel/lib/

#python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/DUD-E/docked_by_Rognan/ADA/docked -P /home/dat/WORK/DB/DUD-E/docked_by_Rognan/ADA/protein.pdb -O DUD-E-ADA_SIFt_c12b0.csv

#python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/DUD-E/docked_by_Rognan/ADA/docked -P /home/dat/WORK/DB/DUD-E/docked_by_Rognan/ADA/protein.pdb -O DUD-E-ADA_elementsv2_c12b0.csv

#python generate.desc.dir.py -B 0 -D sybyl -L /home/dat/WORK/DB/CSAR/2013/cs/cs-confgen_all/SP -P /home/dat/WORK/DB/CSAR/2013/cs/DIG10.2_CS337_B_6_min_prep.pdb -O DIG10.2_sybyl_c12b0.csv

python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/DUD-E/docked_by_Rognan/RENI/docked -P /home/dat/WORK/DB/DUD-E/docked_by_Rognan/RENI/protein.pdb -O DUD-E-RENI_SIFt_c12b0-2.csv

python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/DUD-E/docked_by_Rognan/RENI/docked -P /home/dat/WORK/DB/DUD-E/docked_by_Rognan/RENI/protein.pdb -O DUD-E-RENI_elementsv2_c12b0-2.csv

#python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/DUD-E/docked_by_Rognan/FGFR1/docked -P /home/dat/WORK/DB/DUD-E/docked_by_Rognan/FGFR1/protein.pdb -O DUD-E-FGFR1_SIFt_c12b0.csv

#python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/DUD-E/docked_by_Rognan/FGFR1/docked -P /home/dat/WORK/DB/DUD-E/docked_by_Rognan/FGFR1/protein.pdb -O DUD-E-FGFR1_elementsv2_c12b0.csv
