import os
import sys
from operator import itemgetter
from itertools import groupby, islice, product
from collections import Counter

import numpy
import pybel
from scipy.spatial import KDTree
from openbabel import OBElementTable

from rfscore.config import config, logger, res_atom_types
from rfscore import ob
from rfscore.credo import interactions

def get_contacts(protein, ligand, cutoff):
    """
    Returns a list of inter-atomic contacts in a protein-ligand complex, grouped
    by ligand atoms.
    """
    # CREATE KDTREES FOR BOTH THE PROTEIN AND THE LIGAND
    kdprot = KDTree(numpy.array([atom.coords for atom in protein.atoms]), leafsize=10)
    kdlig = KDTree(numpy.array([atom.coords for atom in ligand.atoms]), leafsize=10)

    # CREATE A SCIPY SPARSE DISTANCE MATRIX
    sdm = kdlig.sparse_distance_matrix(kdprot, cutoff, p=2.0)

    # CREATE A CONTACT LIST OF TUPLES IN THE FORM ((HETATM IDX, ATOM IDX), DISTANCE)
    # AND SORT BY HETATM IDX
    contacts = sorted(sdm.iteritems(), key=itemgetter(0))

    # GROUP CONTACTS BY LIGAND ATOMS
    for hidx, contactiter in groupby(contacts, key=lambda x:x[0][0]):
        hetatm = ligand.OBMol.GetAtom(int(hidx+1))

        atoms = []
        #print(hetatm.GetIdx())

        # IGNORE HYDROGENS
        if hetatm.IsHydrogen(): continue


        for ((hidx,aidx), distance) in contactiter:

            # GET THE PROTEIN ATOM
            atom = protein.OBMol.GetAtom(int(aidx+1))

            # IGNORE THIS ONE AS WELL IF HYDROGEN
            if atom.IsHydrogen(): continue

            atoms.append((atom, distance))

        yield hetatm, atoms

def get_distance_bins(cutoff, binsize):
    """
    """
    # start at zero to get properly distributed distance bins
    bins = numpy.arange(0, cutoff + binsize, binsize)

    # but remove the first bin that would only be hit if a distance is < 0
    bins = bins[1:]

    # DEBUG DISTANCE BINS
    logger.debug("The distance bins in Angstrom are {0}.".format(bins))

    return bins

def sum_descriptor_bins(descriptor, bins):
    """
    """
    # MAKE BIN ZERO THE SUM OF THE OTHER BINS
    for colidx in islice(xrange(descriptor.size), 0, descriptor.size, bins.size + 1):
        descriptor[colidx] += (descriptor[colidx+1:colidx+1+bins.size]).sum()

    return descriptor

def element_descriptor(protein, ligand, binsize=0.0):
	"""
	Calculates a descriptor based on the combination of elements of the interacting
	atoms. This descriptor was used in the original RF-Score paper.


	Parameters
	----------
	protein: str
		Path to the PDB structure of the protein.
	ligand: str
		Path to the structure of the ligand, must be readable by Open Babel.
	binsize: float
		Size of the distance bins in Angstrom that will be used to bin the contacts.
		The total range will be from 1.0 to <cutoff> + <binsize> in <binsize> steps.

	Returns
	-------
	descriptor: numpy.ndarray
		Array containing the sum of the found interactions per element pair (and
		distance bin if specified).
	label: list
		List of labels that can be used as column headers.
	"""
	# SUPPRESS OPENBABEL WARNINGS
	pybel.ob.obErrorLog.StopLogging()

	# ELEMENT TABLE TO DETERMINE VDW AND COVALENT BONDS
	et = OBElementTable()

	# CONVERT ELEMENT SYMBOLS TO ATOMIC NUMBERS
	atomicnums = (et.GetAtomicNum(str(element)) for element in config['elements'])
	atomicnums_pro = (et.GetAtomicNum(str(element)) for element in config['elements_pro'])
	#print(et.GetAtomicNum("Me"), "Fe")

	# CREATE A NUMERICAL ID TO ELEMENT COMBINATION MAPPING
	# IMPORTANT TO MAP THE DESCRIPTOR VECTOR BACK TO THE LABELS
	#element_pairs = product(sorted(atomicnums),repeat=2)
	element_pairs = product(sorted(atomicnums),sorted(atomicnums_pro),repeat=1)
	element_pairs = dict((p,i) for i,p in enumerate(element_pairs))


	# ALSO CREATE A COLUMN LABEL FOR THIS DESCRIPTOR
	sorted_pairs = zip(*sorted(element_pairs.items(), key=itemgetter(1)))[0]
	#print(sorted_pairs)

	numcols = len(element_pairs)

	# GENERATE THE DISTANCE BINS
	if binsize:

		# get the distance bins for the given cutoff and bin size
		bins = get_distance_bins(config['cutoff'], binsize)

		# NUMBER OF TOTAL COLUMNS IN DESCRIPTOR
		numcols *= (bins.size + 1)

		# CREATE A COLUMN FOR EACH ELEMENT PAIR AND DISTANCE BIN
		labels = []
		for x,y in sorted_pairs:
			for i in range(len(bins) + 1):
				label = "{0}.{1}-B{2}".format(et.GetSymbol(x), et.GetSymbol(y), i)
				labels.append(label)

	# LABEL WITHOUT BINS
	else:
		labels = ['.'.join((et.GetSymbol(x),et.GetSymbol(y))) for x,y in sorted_pairs]

	# DESCRIPTOR THAT WILL CONTAIN THE SUM OF ALL ELEMENT-ELEMENT INTERACTIONS
	descriptor = numpy.zeros(numcols, dtype=int)

	# GET THE CONTACTS
	contacts = get_contacts(protein, ligand, config['cutoff'])

	# ITERATE THROUGH CONTACT PAIRS AND DETERMINE SIFT
	for hetatm, hetatm_contacts in contacts:
		hetatm_num = hetatm.GetAtomicNum()

	# ITERATE THROUGH ALL THE CONTACTS THE HETATM HAS
		for atom, distance in hetatm_contacts:
			residue = atom.GetResidue()

			if residue.GetAtomID(atom).strip() in ['FE','FE2']:
				atom_num == 26
			else:
				atom_num = atom.GetAtomicNum()

			# IGNORE WATER RESIDUES
			if residue.GetName() == 'HOH': continue

			# IGNORE ZN,FE ETC.
			try: index = element_pairs[(atom_num, hetatm_num)]
			except KeyError: continue
			#print(element_pairs, 'ele')

			# BIN INTERACTIONS
			if binsize:

				# GET THE BIN THIS CONTACT BELONGS IN
				# DIGITIZE TAKES AN ARRAY-LIKE AS INPUT
				bin_id = numpy.digitize([distance,], bins)[0]
				descriptor[1 + index + index*bins.size + bin_id] += 1

			else:

				# ELEMENTS ARE SORTED NUMERICALLY
				descriptor[index] += 1

	if binsize: sum_descriptor_bins(descriptor, bins)

	return descriptor, labels

def sybyl_atom_type_descriptor(protein, ligand, binsize=0.0):
    """
    Calculates a descriptor based on the combination of elements of the interacting
    atoms. This descriptor was used in the original RF-Score paper.

    Parameters
    ----------
    protein: str
        Path to the PDB structure of the protein.
    ligand: str
        Path to the structure of the ligand, must be readable by Open Babel.
    binsize: float
        Size of the distance bins in Angstrom that will be used to bin the contacts.
        The total range will be from 1.0 to <cutoff> + <binsize> in <binsize> steps.

    Returns
    -------
    descriptor: numpy.ndarray
        Array containing the sum of the founc interactions per element pair (and
        distance bin if specified).
    label: list
        List of labels that can be used as column headers.
    """
    # SUPPRESS OPENBABEL WARNINGS
    pybel.ob.obErrorLog.StopLogging()

    # CREATE A NUMERICAL ID TO SYBYL ATOM TYPE PAIR COMBINATION MAPPING
    # IMPORTANT TO MAP THE DESCRIPTOR VECTOR BACK TO THE LABELS
    sybyl_pairs = product(sorted(config["sybyl atom types"]),repeat=2)
    sybyl_pairs = dict((p,i) for i,p in enumerate(sybyl_pairs))

    # ALSO CREATE A COLUMN LABEL FOR THIS DESCRIPTOR
    sorted_pairs = zip(*sorted(sybyl_pairs.items(), key=itemgetter(1)))[0]

    numcols = len(sybyl_pairs)

    # GENERATE THE DISTANCE BINS
    if binsize:

        # get the distance bins for the given cutoff and bin size
        bins = get_distance_bins(config['cutoff'], binsize)

        # NUMBER OF TOTAL COLUMNS IN DESCRIPTOR
        numcols *= (bins.size + 1)

        # CREATE A COLUMN FOR EACH ELEMENT PAIR AND DISTANCE BIN
        labels = []
        for x,y in sorted_pairs:
            for i in range(len(bins) + 1):
                label = "{0}.{1}-B{2}".format(x, y, i)
                labels.append(label)

    # LABEL WITHOUT BINS
    else:
        labels = ['.'.join((x, y)) for x,y in sorted_pairs]

    # DESCRIPTOR THAT WILL CONTAIN THE SUM OF ALL ELEMENT-ELEMENT INTERACTIONS
    descriptor = numpy.zeros(numcols, dtype=int)

    # GET THE CONTACTS
    contacts = get_contacts(protein, ligand, config['cutoff'])

    # ITERATE THROUGH CONTACT PAIRS AND DETERMINE SIFT
    for hetatm, hetatm_contacts in contacts:
        hetatm_type = hetatm.GetType()

        # ITERATE THROUGH ALL THE CONTACTS THE HETATM HAS
        for atom, distance in hetatm_contacts:
            residue = atom.GetResidue()

            if residue.GetAtomID(atom).strip() in ['FE','FE2']:
                atom_num == 26
		#atom_type = 'Fe'
            else:
                atom_num = atom.GetAtomicNum()
		#atom_type = atom.GetType()

            # IGNORE WATER RESIDUES
            if residue.GetName() == 'HOH': continue

            # IGNORE ZN,FE ETC.
            try: index = sybyl_pairs[(atom_type, hetatm_type)]
            except KeyError: continue

            # BIN INTERACTIONS
            if binsize:

                # GET THE BIN THIS CONTACT BELONGS IN
                # DIGITIZE TAKES AN ARRAY-LIKE AS INPUT
                bin_id = numpy.digitize([distance,], bins)[0]
                descriptor[1 + index + index*bins.size + bin_id] += 1

            else:

                # ELEMENTS ARE SORTED NUMERICALLY
                descriptor[index] += 1

    if binsize: sum_descriptor_bins(descriptor, bins)

    return descriptor, labels

def sift_descriptor(protein, ligand, binsize=0.0):
    """
    Calculates a descriptor of the protein-ligand complex as the sum of the structural
    interaction fingerprints (SIFTs) of all interacting atoms.

    Parameters
    ----------
    protein_path: str
        Path to the PDB structure of the protein.
    ligand_path: str
        Path to the structure of the ligand, must be readable by Open Babel.
    binsize: float
        Size of the distance bins in Angstrom that will be used to bin the contacts.
        The total range will be from 1.0 to <cutoff> + <binsize> in <binsize> steps.

    Returns
    -------
    descriptor: numpy.ndarray
        The shape of the descriptor array will be 1D equal to the number of contact
        types or 2D (number of bins, number of contact types) if a binsize was given.
    """
    # SUPPRESS OPENBABEL WARNINGS
    pybel.ob.obErrorLog.StopLogging()

    # ELEMENT TABLE TO DETERMINE VDW AND COVALENT BONDS
    et = OBElementTable()

    # CREDO DESCRIPTOR LABELS
    interaction_types = ['covalent','vdw_clash','vdw','proximal','hbond','weak_hbond',
                         'xbond','ionic','metal_complex','aromatic','hydrophobic',
                         'carbonyl']

    numcols = len(interaction_types)

    # GENERATE THE DISTANCE BINS
    if binsize:

        # get the distance bins for the given cutoff and bin size
        bins = get_distance_bins(config['cutoff'], binsize)

        offset = bins.size + 1

        # DEBUG DISTANCE BINS
        logger.debug("The distance bins in Angstrom are {0}.".format(bins))

        # NUMBER OF TOTAL COLUMNS IN DESCRIPTOR
        numcols *= (bins.size + 1)

        labels = []
        # CREATE A COLUMN FOR EACH ELEMENT PAIR AND DISTANCE BIN
        for interaction_type in interaction_types:
            for i in range(len(bins) + 1):
                label = "{0}-B{1}".format(interaction_type, i)
                labels.append(label)

    # LABEL WITHOUT BINS
    else: labels = interaction_types

    # DESCRIPTOR THAT WILL CONTAIN THE SUM OF ALL ELEMENT-ELEMENT INTERACTIONS
    descriptor = numpy.zeros(numcols, dtype=int)

    # GET THE ATOM TYPES FOR THE LIGAND
    # CALCULATED ON THE FLY
    lig_atom_types = ob.get_atom_types(ligand, config)

    contacts = get_contacts(protein, ligand, config['cutoff'])

    # ITERATE THROUGH CONTACT PAIRS AND DETERMINE SIFT
    for hetatm, hetatm_contacts in contacts:

        # GET THE ATOM TYPES FOR THE HETATM
        hetatm_types = lig_atom_types[hetatm.GetIdx()]

        # GET ATOM RADII FOR THE LIGAND ATOM
        hetatm_cov = et.GetCovalentRad(hetatm.GetAtomicNum())
        hetatm_vdw = et.GetVdwRad(hetatm.GetAtomicNum())

        # ITERATE THROUGH ALL THE CONTACTS THE HETATM HAS
        for atom, distance in hetatm_contacts:

            # INITIALIZE STRUCTURAL INTERACTION FINGERPRINT
            sift = numpy.zeros(descriptor.size)

            residue = atom.GetResidue()
            res_name = residue.GetName()[:3]

            # IGNORE WATER RESIDUES
            if res_name == 'HOH': continue

            # GET ATOM TYPES FOR THE PROTEIN ATOM
            try:
                atom_types = res_atom_types[res_name][residue.GetAtomID(atom).strip()]
            except KeyError:
                logger.warn("Cannot find atom types for {} {}."
                            .format(res_name, residue.GetAtomID(atom).strip()))
                continue

            sum_cov = hetatm_cov + et.GetCovalentRad(atom.GetAtomicNum())
            sum_vdw = hetatm_vdw + et.GetVdwRad(atom.GetAtomicNum())

            # BIN INTERACTIONS
            if binsize:

                # GET THE BIN THIS CONTACT BELONGS IN
                # DIGITIZE TAKES AN ARRAY-LIKE AS INPUT
                bin_id = numpy.digitize([distance,], bins)[0] + 1

            else:
                offset = 1
                bin_id = 0

            # COVALENT BOND - SHOULD NOT OCCUR IN PDBBIND
            if distance <= sum_cov: sift[0 * offset + bin_id] = 1

            # VAN DER WAALS CLASH
            elif distance <= sum_vdw: sift[1 * offset + bin_id] = 1

            # VAN DER WAALS CONTACT
            elif distance <= sum_vdw + 0.5: sift[2 * offset + bin_id] = 1

            # PROXIMAL
            else: sift[3 * offset + bin_id] = 1

            if interactions.is_hbond(hetatm,hetatm_types,atom,atom_types,distance): sift[4 * offset + bin_id] = 1
            if interactions.is_weak_hbond(hetatm,hetatm_types,atom,atom_types,distance): sift[5 * offset + bin_id] = 1
            if interactions.is_xbond(hetatm,hetatm_types,atom,atom_types,distance): sift[6 * offset + bin_id] = 1
            if interactions.is_ionic(hetatm,hetatm_types,atom,atom_types,distance): sift[7 * offset + bin_id] = 1
            if interactions.is_metal_complex(hetatm,hetatm_types,atom,atom_types,distance): sift[8 * offset + bin_id] = 1
            if interactions.is_aromatic(hetatm,hetatm_types,atom,atom_types,distance): sift[9 * offset + bin_id] = 1
            if interactions.is_hydrophobic(hetatm,hetatm_types,atom,atom_types,distance): sift[10 * offset + bin_id] = 1
            if interactions.is_carbonyl(hetatm,hetatm_types,atom,atom_types,distance): sift[11 * offset + bin_id] = 1

            descriptor += sift

    if binsize: sum_descriptor_bins(descriptor, bins)

    return descriptor, labels
