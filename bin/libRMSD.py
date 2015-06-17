__author__ = 'dat'

import subprocess
import os
import csv

TMP_FILE        = '/home/dat/rmsd.tmp'

def calcRMSD(refLigand, calcLigand):
    f = open(TMP_FILE, "w")
    run_cmd = "rms_analysis " + refLigand + " " + calcLigand
    subprocess.call(run_cmd.split(), stdout=f)

def parseRMSDoutput(outputFile = TMP_FILE):
    FILE  = open(outputFile, 'r')
    for line in FILE:
        if line.find('Distance') > -1:
            pass
            #break # found the identified line
    #line = FILE.readline() # read the next line
    return(line.split()[0])

# return a list of RMSDs for all poses in poseDir, pose files are assumed to start with prefix gold_soln
# \TODO: change the prefix
def calcRMSDPoses(refLigand, poseDir, pattern = "gold_soln"):
    RMSDs = {}
    for ligand in os.listdir(poseDir):
        if ligand.startswith(pattern):
            rmsd = calcRMSD(refLigand, os.path.join(poseDir, ligand))
            RMSDs[ligand] = parseRMSDoutput()
    return (RMSDs)

#
def writeRMSD2CSV(RMSDs, output):
    FILE = open(output, 'w')
    CSV = csv.writer(FILE, delimiter=',')
    # write the csv header
    CSV.writerow(["ID", "RMSDs"])

    for ligandID in RMSDs.keys():
        entry = [ligandID] + [RMSDs[ligandID]]
        CSV.writerow(entry)
    FILE.close()
