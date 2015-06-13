export PYTHONPATH=/home/dat/Apps/openbabel/lib64/python2.7/site-packages:/home/dat/WORK/dev:$PYTHONPATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dat/Apps/openbabel/lib/

#python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/CSAR/2013/cs/cs-confgen_all/ASP -P /home/dat/WORK/DB/CSAR/2013/cs/DIG10.2_CS337_B_6_min_prep.pdb -O DIG10.2_SIFt_c12b0_ASP.csv

#python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/CSAR/2013/cs/cs-confgen_all/ASP -P /home/dat/WORK/DB/CSAR/2013/cs/DIG10.2_CS337_B_6_min_prep.pdb -O DIG10.2_elementsv2_c12b0_ASP.csv

#python generate.desc.dir.py -B 0 -D sybyl -L /home/dat/WORK/DB/CSAR/2013/cs/cs-confgen_all/SP -P /home/dat/WORK/DB/CSAR/2013/cs/DIG10.2_CS337_B_6_min_prep.pdb -O DIG10.2_sybyl_c12b0.csv

#python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/CSAR/2013/cs/cs-confgen_all/PLP -P /home/dat/WORK/DB/CSAR/2013/cs/DIG10.2_CS337_B_6_min_prep.pdb -O DIG10.2_SIFt_c12b0_PLP.csv

#python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/CSAR/2013/cs/cs-confgen_all/PLP -P /home/dat/WORK/DB/CSAR/2013/cs/DIG10.2_CS337_B_6_min_prep.pdb -O DIG10.2_elementsv2_c12b0_PLP.csv

#python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/CSAR/2013/cs/cs-confgen_all/chemscore -P /home/dat/WORK/DB/CSAR/2013/cs/DIG10.2_CS337_B_6_min_prep.pdb -O DIG10.2_SIFt_c12b0_chemscore.csv

#python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/CSAR/2013/cs/cs-confgen_all/chemscore -P /home/dat/WORK/DB/CSAR/2013/cs/DIG10.2_CS337_B_6_min_prep.pdb -O DIG10.2_elementsv2_c12b0_chemscore.csv

python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/CSAR/2013/cs/cs-confgen_all/goldscore -P /home/dat/WORK/DB/CSAR/2013/cs/DIG10.2_CS337_B_6_min_prep.pdb -O DIG10.2_SIFt_c12b0_goldscore.csv

python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/CSAR/2013/cs/cs-confgen_all/goldscore -P /home/dat/WORK/DB/CSAR/2013/cs/DIG10.2_CS337_B_6_min_prep.pdb -O DIG10.2_elementsv2_c12b0_goldscore.csv
