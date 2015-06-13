__author__ = 'dat'

'''
TODO: optimize + write comments

'''

import os.path

def convertCSV2ARFF(CSVPath, ARFFPath, batchFile):
    '''
    convert all CSV files in CSVPath to ARFF files at ARFFPath using weka
    '''
    SHFILE  = open(batchFile, 'a')

    for entry in os.listdir(CSVPath):

        if os.path.isfile(os.path.join(CSVPath,entry)):
            # print(entry)
            line = "java -Xmx6144m -cp weka.jar weka.core.converters.CSVLoader " + os.path.join(CSVPath,entry) + " > " + os.path.join(ARFFPath,os.path.splitext(entry)[0] + ".arff\n")
            SHFILE.write(line)

    SHFILE.close()

def concatCutoffAndBinsize(desc, cutoff, binsize):
    '''
    concatenate description with appreciated cutoff and binsize
    '''
    if ((desc == "credo") and (binsize == 12)):
        fullDesc = desc + "_c" + str(cutoff)
    else:
        fullDesc = desc + "_c" + str(cutoff) + "b" + str(binsize)
    return (fullDesc)

def createClassifyScriptPDBbind(batchFile):
    SHFILE  = open(batchFile, 'w')

    for trainingPrefix in trainingList:
        for desc in descList:
            for binsize in binsizeList:
                # create the right name for training set
                trainingName = os.path.join(trainingPath, trainingPrefix+"_training_"+concatCutoffAndBinsize(desc,cutoff,binsize)+".arff")
                if not os.path.exists(trainingName):
                    print(trainingName)
                    quit()

                line = cmdRemove + trainingName + " -o train.arff\n"
                #print(line)
                SHFILE.write(line)

                # create the right name for test set
                # for reproducing purpose
                testName = os.path.join(testPath, trainingPrefix+"_training_"+concatCutoffAndBinsize(desc,cutoff,binsize)+".arff")
                if not os.path.exists(testName):
                    print(testName)
                    quit()

                line = cmdRemove + testName + " -o test.arff\n"
                #print(line)
                SHFILE.write(line)

                for i in range(len(postCmdRoF_Methods)):
                    resultName = os.path.join(resultPath, trainingPrefix+"_training_"+cmdClassifyName+"-"+
                                              postCmdRoF_MethodsName[i]+"_"+concatCutoffAndBinsize(desc,cutoff,binsize)+".csv")
                    line = cmdClassify + postCmdRoF + postCmdRoF_Methods[i] + " > " + resultName + "\n"
                    #print(line)
                    SHFILE.write(line)

                # for testing purpose
                testName = os.path.join(testPath, trainingPrefix+"_test_"+concatCutoffAndBinsize(desc,cutoff,binsize)+".arff")
                if not os.path.exists(testName):
                    print(testName)
                    quit()

                line = cmdRemove + testName + " -o test.arff\n"
                #print(line)
                SHFILE.write(line)

                for i in range(len(postCmdRoF_Methods)):
                    resultName = os.path.join(resultPath, trainingPrefix+"_test_"+cmdClassifyName+"-"+
                                              postCmdRoF_MethodsName[i]+"_"+concatCutoffAndBinsize(desc,cutoff,binsize)+".csv")
                    line = cmdClassify + postCmdRoF + postCmdRoF_Methods[i] + " > " + resultName + "\n"
                    #print(line)
                    SHFILE.write(line)

    SHFILE.close()

def createClassifyScript(batchFile, trainingSet, DBsetPrefix, DBsetPostfix):

    SHFILE  = open(batchFile, 'a')

    for trainingPrefix in trainingList[0:3]:
        for desc in descList:
            for binsize in binsizeList:
                # create the right name for training set
                trainingName = os.path.join(trainingPath, trainingPrefix+trainingSet+concatCutoffAndBinsize(desc,cutoff,binsize)+".arff")
                if not os.path.exists(trainingName):
                    print(trainingName)
                    quit()

                line = cmdRemove + trainingName + " -o train.arff\n"
                print(line)
                SHFILE.write(line)

                # create the right name for test set
                #testName = os.path.join(testPath, DBsetPrefix+concatCutoffAndBinsize(desc,cutoff,binsize)+".arff")
                # for testing purpose
                testName = os.path.join(testPath, DBsetPrefix+concatCutoffAndBinsize(desc,cutoff,binsize)+DBsetPostfix+".arff")
                if not os.path.exists(testName):
                    print(testName)
                    quit()

                line = cmdRemove + testName + " -o test.arff\n"
                print(line)
                SHFILE.write(line)

                for i in range(len(postCmdRoF_Methods)):
                    resultName = os.path.join(resultPath, trainingPrefix+trainingSet+DBsetPrefix+cmdClassifyName+"-"+
                                              postCmdRoF_MethodsName[i]+"_"+concatCutoffAndBinsize(desc,cutoff,binsize)+DBsetPostfix+".csv")
                    line = cmdClassify + postCmdRoF + postCmdRoF_Methods[i] + " > " + resultName + "\n"
                    print(line)
                    SHFILE.write(line)

                #line = cmdRename + testName + " -o test.arff\n"
                #print(line)
                #SHFILE.write(line)

                # create the right name for classifier result
                #for i in range(len(postfixClassifyMethodsName)):
                 #   resultName = os.path.join(resultPath, trainingSet+"-"+postfixClassifyMethodsName[i]+"-"+DBsetPrefix+concatCutoffAndBinsize(desc,cutoff,binsize)+".csv")

                  #  line = prefixRename + testName + " -o test.arff\n"
                    #print(line)
                  #  SHFILE.write(line)
                  #  line = prefixClassify + postfixClassifyo + postfixClassifyMethods[i] + " > " + resultName + "\n"
                    #print(line)
                  #  SHFILE.write(line)

    SHFILE.close()


trainingPath    = "/home/dat/arff/New/"
testPath        = "/home/dat/arff/DIG/"
resultPath      = "/home/dat/WORK/dev/weka-3-7-12/results/"

# for Jelena's data
#testPath        = "/home/dat/arff/Jelena/"
#resultPath      = "/home/dat/WORK/dev/weka/results/"
#prefixRemove    = "java -Xmx25000M weka.filters.unsupervised.attribute.Remove -R last -i "
#prefixRename    = "java -Xmx25000M weka.filters.unsupervised.attribute.RenameAttribute -find \"ID\" -replace \"pKd.pKi\" -i "

cmdRemove    = "java -Xmx25000M weka.filters.unsupervised.attribute.Remove -R first -i "
cmdRename    = "java -Xmx25000M weka.filters.unsupervised.attribute.RenameAttribute -find \"scores\" -replace \"pKd.pKi\" -i "

cmdClassify  = "java -Xmx25000M weka.classifiers.meta.RotationForest -t train.arff -T test.arff -c 1 -no-cv -o -classifications " \
                        "\"weka.classifiers.evaluation.output.prediction.CSV\" -G 3 -H 3 -P 50 -F "
#                "java -Xmx25000M weka.classifiers.trees.RandomForest -t train.arff -T test.arff -c 1 -no-cv -o -classifications " \
#                        "\"weka.classifiers.evaluation.output.prediction.CSV\" -I 500 -K 0 -S 1 -num-slots 4 "]

cmdClassifyName = "RoF"

postCmdRoF = "\"weka.filters.unsupervised.attribute.PrincipalComponents -R 1.0 -A 5 -M -1\" -S 1 -num-slots 4 -I 100 " \
             "-W weka.classifiers.meta.RandomCommittee -- -S 1 -num-slots 4 -I 10 "

postCmdRoF_Methods  = ["-W weka.classifiers.trees.RandomTree -- -K 0 -M 1.0 -V 0.001 -S 1",
                       "-W weka.classifiers.trees.REPTree -- -M 2 -V 0.001 -N 3 -S 1 -L -1 -P -I 0.0"]

postCmdRoF_MethodsName = ["RT", "REP"]

descList    = ["elementsv2-SIFt"]#, "elementsv2-SIFtv2"]
binsizeList = [0]
cutoff      = 12
trainingList = ["CASF12", "CASF13", "CASF14"]


############# MAIN PART ########################
if __name__=='__main__':
    '''
    '''
    #batchFile = "/home/dat/WORK/dev/weka-3-6-11/convertCSV2ARFF.sh"
    #convertCSV2ARFF("/home/dat/WORK/DB/DESCRIPTORS/DIG/", "/home/dat/arff/DIG", batchFile)

#    batchFile = "/home/dat/WORK/dev/weka-3-7-12/performScoring.sh"
#    createClassifyScriptPDBbind(batchFile)

    batchFile = "/home/dat/WORK/dev/weka-3-7-12/performScoring_JMJ.sh"
    DBStruc = ["T36_JMJ_Xray_", "3PDQ_new_"]
    DBSet = ["_actives", "_inactives", "_test_gold"]
    trainingMetalSet = ["_refined_", "_metallo_"]
    for eachtraining in trainingMetalSet:
        for db in DBStruc:
            for eachset in DBSet:
                print("dummy")
                #createClassifyScript(batchFile, trainingSet=eachtraining, DBsetPrefix=db, DBsetPostfix=eachset)

    for eachset in ["_SP", "_XP"]:
        createClassifyScript(batchFile = "/home/dat/WORK/dev/weka-3-7-12/performScoring_DIG.sh", trainingSet="_refined_", DBsetPrefix="DIG10.2_", DBsetPostfix=eachset)

    #batchFile = "/home/dat/WORK/dev/weka/performScoring.sh"
    #JelenaAllSets = ["140722_set1_maestro_", "140722_set2_maestro_", "140722_set3_maestro_"]
    #for eachset in JelenaAllSets:
     #   createClassifyScript(batchFile, eachset)
