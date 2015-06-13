__author__ = 'dat'
'''
generate descriptors from a protein in pdb format and a directory of ligands in mol2 format
'''
import os
import glob
import sys
import csv
import logging
from optparse import OptionParser

from rfscore.config import logger
from rfscore.credo import contacts
from rfscore.ob import get_molecule

def parse_options():
    '''
    '''
    # PARSE COMMAND LINE
    usage  = "%prog [options]"
    parser = OptionParser(usage=usage)

    parser.add_option("--debug",
                      action  = "store_true",
                      dest    = "debug",
                      default = False,
                      help    = 'Set logging level to debug and print more verbose output.')

    parser.add_option("-B", "--binsize",
                      dest    = "binsize",
                      type    = float,
                      default = 2,
                      help    = "Bin size (in Angstrom) to use for binning contacts based on inter-atomic distance.")

    parser.add_option("-F", "--format",
                      dest    = "format",
                      default = 'csv',
                      help    = "Format to use for writing the SIFt of the protein-ligand complex.")

    parser.add_option("-O", "--output",
                      dest    = "output",
                      default = "/home/dat/WORK/DB/Inna/hm_2esm_all329_elements_c12b2.csv",#None,
                      help    = "File to which the data will be written (default=STDOUT).")

    parser.add_option("-L", "--inputligdir",
                      dest    = "inputligdir",
                      default = "/home/dat/WORK/DB/Inna/201308_all329",
                      help    = "Input directory of ligands in mol2 format (default=/home/).")

    parser.add_option("-P", "--inputpdb",
                      dest    = "inputpdb",
                      default = "/home/dat/WORK/DB/Inna/hm_2esm.pdb",
                      help    = "Input of protein in pdb format (default=/home/).")

    parser.add_option("-D", "--descriptor",
                      dest    = "descriptor",
                      default = 'elements',
                      help    = "Descriptor to use. Valid descriptors are 'credo', 'elements' and 'sybyl'.")

    # GET COMMAND LINE OPTIONS
    (options, args) = parser.parse_args()

    if options.descriptor not in ('elements', 'credo', 'sybyl'):
        logger.fatal("Invalid descriptor: {0}.".format(options.descriptor))
        parser.print_help()
        sys.exit(1)

    return options

def main():
    '''
    '''
    options = parse_options()

    # THIS OPTION WILL PRODUCE MORE VERBOSE OUTPUT
    if options.debug: logger.setLevel(logging.DEBUG)

    if options.output: fh = open(options.output,'wb')
    else: fh = sys.stdout

    # CHOOSE HOW THE OUPTPUT DATA WILL BE WRITTEN
    if options.format == 'csv':
        writer = csv.writer(fh, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)


    HEADER = True

    # iterate through all mol2 files in inputdir
    for mol2file in glob.glob(os.path.join(options.inputligdir, '*.mol2')):
        #lig_path = os.path.join(option.inputdir, file)
        lig_path        = mol2file
        protein_path    = options.inputpdb

        if not os.path.isfile(protein_path):
            logger.fatal("The protein file does not exist.".format(options.inputpdb))
            sys.exit(1)

        protein = get_molecule(protein_path)
        ligand  = get_molecule(lig_path)

        # calculate descriptor based on the sum of interacting element pairs
        if options.descriptor == 'elements':

            # calculate element pair descriptor for this complex
            descriptor, labels = contacts.element_descriptor(protein, ligand,
                                                             binsize=options.binsize)

        # calculate descriptor based on the sum of interacting element pairs
        elif options.descriptor == 'sybyl':

            # calculate element pair descriptor for this complex
            descriptor, labels = contacts.sybyl_atom_type_descriptor(protein, ligand,
                                                                     binsize=options.binsize)

        # calculate descriptor using structural interaction fingerprints
        elif options.descriptor == 'credo':

            # get the protein-ligand structural interaction fingerprint
            descriptor, labels = contacts.sift_descriptor(protein, ligand,
                                                          binsize=options.binsize)

        if HEADER:

            # UPDATE COLUMN LABELS
            labels.append('ligand')

            writer.writerow(labels)

            HEADER = False

        if options.format == 'csv':
            #ligandname = "\"" + os.path.basename(lig_path).split('.')[0] + "\""
            ligandname = os.path.basename(lig_path).split('.')[0]

            #print(ligandname)
            # FIRST COLUMN OF OUTPUT ROW
            row = descriptor.tolist() + [ligandname]

            writer.writerow(row)

main()

