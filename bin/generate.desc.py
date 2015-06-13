__author__ = 'dat'
'''
generate descriptors from a protein in pdb format and a directory of ligands in mol2 format
'''
import os
import re
import sys
import csv
import logging
from math import log10
from operator import itemgetter
from optparse import OptionParser

from rfscore.config import config, logger
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
                      default = 0.0,
                      help    = "Bin size (in Angstrom) to use for binning contacts based on inter-atomic distance.")

    parser.add_option("-F", "--format",
                      dest    = "format",
                      default = 'csv',
                      help    = "Format to use for writing the SIFt of the protein-ligand complex.")

    parser.add_option("-O", "--output",
                      dest    = "output",
                      default = None,
                      help    = "File to which the data will be written (default=STDOUT).")

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

    pdbbindconf = config['standard']

    data = parse_index(options.pdbbind, options.index)

    if options.output: fh = open(options.output,'wb')
    else: fh = sys.stdout

    # CHOOSE HOW THE OUPTPUT DATA WILL BE WRITTEN
    if options.format == 'csv':
        writer = csv.writer(fh, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)


    HEADER = True

    # ITERATE THROUGH ALL PROTEIN-LIGAND COMPLEXES
    for pdb in data:

        # NORMALISE ACTIVITY TO NANOMOLAR
        pkd = get_pkd(float(data[pdb]['value']), data[pdb]['unit'])

        # THE PDBBIND DIRECTORY CONTAINING ALL THE STRUCTURES FOR THIS PDB ENTRY
        entry_dir = os.path.join(options.pdbbind,pdb)

        # CHECK IF THE DIRECTORY ACTUALLY EXISTS
        if not os.path.exists(entry_dir):
            logger.error("The PDBbind directory for PDB entry {0} does not exist.".format(pdb))
            continue

        # CREATE THE PATHS TO THE PROTEIN AND LIGAND USING THE SPECIFIC _<POCKET,PROTEIN,LIGAND,ZINC> LABEL
        prot_path = os.path.join(entry_dir,'{0}_{1}.pdb'.format(pdb,pdbbindconf['protein']))
        lig_path = os.path.join(entry_dir,'{0}_{1}.mol2'.format(pdb,pdbbindconf['ligand']))

        if not os.path.exists(prot_path):
            logger.error("The protein pocket structure for PDB entry {0} cannot be found.".format(pdb))
            continue

        elif not os.path.exists(lig_path):
            logger.error("The ligand structure for PDB entry {0} cannot be found.".format(pdb))
            continue

        protein = get_molecule(prot_path)
        ligand = get_molecule(lig_path)

        # CALCULATE DESCRIPTOR USING STRUCTURAL INTERACTION FINGERPRINTS
        if options.descriptor == 'credo':

            # GET THE PROTEIN-LIGAND STRUCTURAL INTERACTION FINGERPRINT
            descriptor, labels = contacts.sift_descriptor(protein, ligand, binsize=options.binsize)

        # CALCULATE DESCRIPTOR BASED ON THE SUM OF INTERACTING ELEMENT PAIRS
        elif options.descriptor == 'elements':

            # CALCULATE ELEMENT PAIR DESCRIPTOR FOR THIS COMPLEX
            descriptor, labels = contacts.element_descriptor(protein, ligand, binsize=options.binsize)

        # CALCULATE DESCRIPTOR BASED ON THE SUM OF INTERACTING ELEMENT PAIRS
        elif options.descriptor == 'sybyl':

            # CALCULATE ELEMENT PAIR DESCRIPTOR FOR THIS COMPLEX
            descriptor, labels = contacts.sybyl_atom_type_descriptor(protein, ligand, binsize=options.binsize)

        if HEADER:

            # UPDATE COLUMN LABELS
            labels.insert(0,'pKd/pKi')
            labels.append('pdb')

            writer.writerow(labels)

            HEADER = False

        if options.format == 'csv':

            # KEEP ONLY THE TWO MOST SIGNIFICANT BITS
            pkdstring = "{0:.2f}".format(pkd)

            # FIRST COLUMN OF OUTPUT ROW
            row = [pkdstring] + descriptor.tolist() + [pdb]

            writer.writerow(row)

main()

