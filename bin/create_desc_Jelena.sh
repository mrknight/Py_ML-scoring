export PYTHONPATH=/home/dat/Apps/openbabel/lib64/python2.7/site-packages:/home/dat/WORK/dev:$PYTHONPATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dat/Apps/openbabel/lib/

python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_elements_c12b0.csv
python generate.desc.dir.py -B 1 -D elements -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_elements_c12b1.csv
python generate.desc.dir.py -B 2 -D elements -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_elements_c12b2.csv
python generate.desc.dir.py -B 12 -D elements -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_elements_c12b12.csv

python generate.desc.dir.py -B 0 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_sybyl_c12b0.csv
python generate.desc.dir.py -B 1 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_sybyl_c12b1.csv
python generate.desc.dir.py -B 2 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_sybyl_c12b2.csv
python generate.desc.dir.py -B 12 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_sybyl_c12b12.csv

python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_credo_c12b0.csv
python generate.desc.dir.py -B 1 -D credo -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_credo_c12b1.csv
python generate.desc.dir.py -B 2 -D credo -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_credo_c12b2.csv
python generate.desc.dir.py -B 4.5 -D credo -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_moe_Dat.pdb -O 140722_set1_moe_credo_c12.csv

python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_elements_c12b0.csv
python generate.desc.dir.py -B 1 -D elements -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_elements_c12b1.csv
python generate.desc.dir.py -B 2 -D elements -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_elements_c12b2.csv
python generate.desc.dir.py -B 12 -D elements -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_elements_c12b12.csv

python generate.desc.dir.py -B 0 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_sybyl_c12b0.csv
python generate.desc.dir.py -B 1 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_sybyl_c12b1.csv
python generate.desc.dir.py -B 2 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_sybyl_c12b2.csv
python generate.desc.dir.py -B 12 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_sybyl_c12b12.csv

python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_credo_c12b0.csv
python generate.desc.dir.py -B 1 -D credo -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_credo_c12b1.csv
python generate.desc.dir.py -B 2 -D credo -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_credo_c12b2.csv
python generate.desc.dir.py -B 4.5 -D credo -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_moe_Dat.pdb -O 140722_set2_moe_credo_c12.csv

python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_elements_c12b0.csv
python generate.desc.dir.py -B 1 -D elements -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_elements_c12b1.csv
python generate.desc.dir.py -B 2 -D elements -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_elements_c12b2.csv
python generate.desc.dir.py -B 12 -D elements -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_elements_c12b12.csv

python generate.desc.dir.py -B 0 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_sybyl_c12b0.csv
python generate.desc.dir.py -B 1 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_sybyl_c12b1.csv
python generate.desc.dir.py -B 2 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_sybyl_c12b2.csv
python generate.desc.dir.py -B 12 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_sybyl_c12b12.csv

python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_credo_c12b0.csv
python generate.desc.dir.py -B 1 -D credo -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_credo_c12b1.csv
python generate.desc.dir.py -B 2 -D credo -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_credo_c12b2.csv
python generate.desc.dir.py -B 4.5 -D credo -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_moe_Dat.pdb -O 140722_set3_moe_credo_c12.csv

python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_elements_c12b0.csv
python generate.desc.dir.py -B 1 -D elements -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_elements_c12b1.csv
python generate.desc.dir.py -B 2 -D elements -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_elements_c12b2.csv
python generate.desc.dir.py -B 12 -D elements -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_elements_c12b12.csv

python generate.desc.dir.py -B 0 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_sybyl_c12b0.csv
python generate.desc.dir.py -B 1 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_sybyl_c12b1.csv
python generate.desc.dir.py -B 2 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_sybyl_c12b2.csv
python generate.desc.dir.py -B 12 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_sybyl_c12b12.csv

python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_credo_c12b0.csv
python generate.desc.dir.py -B 1 -D credo -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_credo_c12b1.csv
python generate.desc.dir.py -B 2 -D credo -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_credo_c12b2.csv
python generate.desc.dir.py -B 4.5 -D credo -L /home/dat/WORK/DB/Jelena/140722_set1_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set1_protein_maestro_Dat.pdb -O 140722_set1_maestro_credo_c12.csv

python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_elements_c12b0.csv
python generate.desc.dir.py -B 1 -D elements -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_elements_c12b1.csv
python generate.desc.dir.py -B 2 -D elements -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_elements_c12b2.csv
python generate.desc.dir.py -B 12 -D elements -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_elements_c12b12.csv

python generate.desc.dir.py -B 0 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_sybyl_c12b0.csv
python generate.desc.dir.py -B 1 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_sybyl_c12b1.csv
python generate.desc.dir.py -B 2 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_sybyl_c12b2.csv
python generate.desc.dir.py -B 12 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_sybyl_c12b12.csv

python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_credo_c12b0.csv
python generate.desc.dir.py -B 1 -D credo -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_credo_c12b1.csv
python generate.desc.dir.py -B 2 -D credo -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_credo_c12b2.csv
python generate.desc.dir.py -B 4.5 -D credo -L /home/dat/WORK/DB/Jelena/140722_set2_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set2_protein_maestro_Dat.pdb -O 140722_set2_maestro_credo_c12.csv

python generate.desc.dir.py -B 0 -D elements -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_elements_c12b0.csv
python generate.desc.dir.py -B 1 -D elements -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_elements_c12b1.csv
python generate.desc.dir.py -B 2 -D elements -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_elements_c12b2.csv
python generate.desc.dir.py -B 12 -D elements -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_elements_c12b12.csv

python generate.desc.dir.py -B 0 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_sybyl_c12b0.csv
python generate.desc.dir.py -B 1 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_sybyl_c12b1.csv
python generate.desc.dir.py -B 2 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_sybyl_c12b2.csv
python generate.desc.dir.py -B 12 -D sybyl -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_sybyl_c12b12.csv

python generate.desc.dir.py -B 0 -D credo -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_credo_c12b0.csv
python generate.desc.dir.py -B 1 -D credo -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_credo_c12b1.csv
python generate.desc.dir.py -B 2 -D credo -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_credo_c12b2.csv
python generate.desc.dir.py -B 4.5 -D credo -L /home/dat/WORK/DB/Jelena/140722_set3_ligands_Dat -P /home/dat/WORK/DB/Jelena/140722_set3_protein_maestro_Dat.pdb -O 140722_set3_maestro_credo_c12.csv
