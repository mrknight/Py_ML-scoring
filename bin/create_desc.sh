export PYTHONPATH=/home/dat/Apps/openbabel/lib64/python2.7/site-packages:/home/dat/WORK/dev:$PYTHONPATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dat/Apps/openbabel/lib/

#python pdbbind.py -O CASF14_refined_SIFt_c12b0.csv -D credo 		-P /home/dat/WORK/DB/PDBbind/v2014-refined/ -I /home/dat/WORK/DB/PDBbind/v2014-refined/INDEX_refined_data.2014
#python pdbbind.py -O CASF13_refined_SIFt_c12b0.csv -D credo 		-P /home/dat/WORK/DB/PDBbind/v2013-refined/ -I /home/dat/WORK/DB/PDBbind/v2013-refined/INDEX_refined_data.2013
#python pdbbind.py -O CASF12_refined_SIFt_c12b0.csv -D credo 		-P /home/dat/WORK/DB/PDBbind/v2012-refined/ -I /home/dat/WORK/DB/PDBbind/v2012-refined/INDEX_refined_data.2012

python pdbbind.py -O CASF14_core_SIFt_c12b0.csv -D credo 			-P /home/dat/WORK/DB/PDBbind/v2013-core/ -I /home/dat/WORK/DB/PDBbind/v2013-core/INDEX_core_data.2013
python pdbbind.py -O CASF13_core_SIFt_c12b0.csv -D credo 			-P /home/dat/WORK/DB/PDBbind/v2013-core/ -I /home/dat/WORK/DB/PDBbind/v2013-core/INDEX_core_data.2013
python pdbbind.py -O CASF12_core_SIFt_c12b0.csv -D credo 			-P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012-core/2012_core_data.lst

python pdbbind.py -O CASF14_refined_elementsv2_c12b0.csv -D elements 	-P /home/dat/WORK/DB/PDBbind/v2014-refined/ -I /home/dat/WORK/DB/PDBbind/v2014-refined/INDEX_refined_data.2014
python pdbbind.py -O CASF13_refined_elementsv2_c12b0.csv -D elements 	-P /home/dat/WORK/DB/PDBbind/v2013-refined/ -I /home/dat/WORK/DB/PDBbind/v2013-refined/INDEX_refined_data.2013
python pdbbind.py -O CASF12_refined_elementsv2_c12b0.csv -D elements 	-P /home/dat/WORK/DB/PDBbind/v2012-refined/ -I /home/dat/WORK/DB/PDBbind/v2012-refined/INDEX_refined_data.2012

python pdbbind.py -O CASF14_core_elementsv2_c12b0.csv -D elements 		-P /home/dat/WORK/DB/PDBbind/v2013-core/ -I /home/dat/WORK/DB/PDBbind/v2014-core/INDEX_core_data.2013
python pdbbind.py -O CASF13_core_elementsv2_c12b0.csv -D elements 		-P /home/dat/WORK/DB/PDBbind/v2013-core/ -I /home/dat/WORK/DB/PDBbind/v2013-core/INDEX_core_data.2013
python pdbbind.py -O CASF12_core_elementsv2_c12b0.csv -D elements 		-P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012-core/2012_core_data.lst

#python pdbbind.py -B 1 -O CASF12_core_sybyl_c12b1.csv -D sybyl               -P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012/INDEX_core_data.2012
#python pdbbind.py -B 1 -O CASF12_core_elements_c12b1.csv -D elements                 -P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012/INDEX_core_data.2012
#python pdbbind.py -B 1 -O CASF12_core_credo_c12b1.csv -D credo                         -P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012/INDEX_core_data.2012

#python pdbbind.py -B 2 -O CASF12_core_sybyl_c12b2.csv -D sybyl               -P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012/INDEX_core_data.2012
#python pdbbind.py -B 2 -O CASF12_core_elements_c12b2.csv -D elements                 -P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012/INDEX_core_data.2012
#python pdbbind.py -B 2 -O CASF12_core_credo_c12b2.csv -D credo                         -P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012/INDEX_core_data.2012

#python pdbbind.py -B 12 -O CASF12_core_sybyl_c12b12.csv -D sybyl 		-P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012/INDEX_core_data.2012
#python pdbbind.py -B 12 -O CASF12_core_elements_c12b12.csv -D elements 		-P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012/INDEX_core_data.2012
#python pdbbind.py -B 4.5 -O CASF12_core_credo_c12.csv -D credo 			-P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012/INDEX_core_data.2012

#python pdbbind.py -B 2 -O CASF07_test_elements.csv -D elements -P /home/dat/WORK/DB/PDBbind/v2007/ -I /home/dat/WORK/DB/PDBbind/v2007/INDEX.2007.core.data
#python pdbbind.py --debug -D elements -O CASF13_test_elements.csv -P /home/dat/WORK/DB/PDBbind/v2013-core/  -I /home/dat/WORK/DB/PDBbind/v2013-core/INDEX_core_data.2013
#python pdbbind.py --debug -D elements -O CASF12_test_elements.csv -P /home/dat/WORK/DB/PDBbind/v2012-core/ -I /home/dat/WORK/DB/PDBbind/v2012/INDEX_core_data.2012
