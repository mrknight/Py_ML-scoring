export PYTHONPATH=/home/dat/Apps/openbabel/lib64/python2.7/site-packages:/home/dat/WORK/dev:$PYTHONPATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dat/Apps/openbabel/lib/

#python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/JMJD/2015-Jan-13/actives -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_elementsv2_c12b0_actives.csv

#python generate.desc.dir.py -B 0   -D credo -L /home/dat/WORK/DB/JMJD/2015-Jan-13/actives -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_SIFt_c12b0_actives.csv
#python generate.desc.dir.py -B 1   -D credo -L /home/dat/WORK/DB/JMJD/2015-Jan-13/actives -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_SIFt_c12b1_actives.csv
#python generate.desc.dir.py -B 2   -D credo -L /home/dat/WORK/DB/JMJD/2015-Jan-13/actives -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_SIFt_c12b2_actives.csv
#python generate.desc.dir.py -B 4.5 -D credo -L /home/dat/WORK/DB/JMJD/2015-Jan-13/actives -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_SIFt_c12_actives.csv

#python generate.desc.dir.py -B 0 -D sybyl -L /home/dat/WORK/DB/JMJD/2015-Jan-13/actives -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_sybyl_c12b0.csv

#python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/JMJD/2015-Jan-13/inactives -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_elementsv2_c12b0_inactives.csv

#python generate.desc.dir.py -B 0   -D credo -L /home/dat/WORK/DB/JMJD/2015-Jan-13/inactives -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_SIFt_c12b0_inactives.csv

#python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/JMJD/2015-Jan-13/test_gold -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_elementsv2_c12b0_test_gold.csv

#python generate.desc.dir.py -B 0   -D credo -L /home/dat/WORK/DB/JMJD/2015-Jan-13/test_gold -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_SIFt_c12b0_test_gold.csv

echo 'SIFtv2'
#python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/JMJD/1ctu -P /home/dat/WORK/DB/JMJD/1ctu/1ctu_protein.pdb -O 1ctu_test.csv

python generate.desc.dir.py -B 0   -D credo -L /home/dat/WORK/DB/JMJD/2015-Jan-13/actives -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_SIFtv2_c12b0_actives.csv
python generate.desc.dir.py -B 0   -D credo -L /home/dat/WORK/DB/JMJD/2015-Jan-13/inactives -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_SIFtv2_c12b0_inactives.csv
python generate.desc.dir.py -B 0   -D credo -L /home/dat/WORK/DB/JMJD/2015-Jan-13/test_gold -P /home/dat/WORK/DB/JMJD/2014-Nov-18/T36_JMJ_Xray.pdb -O T36_JMJ_Xray_SIFtv2_c12b0_test_gold.csv
