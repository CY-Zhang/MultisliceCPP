Multislice package updated 12/9/16, cz

Update on 2/27/17:
- probe, auotslic modified to use the freqn function with float variables
- makefile updated to compile/remove all files we have here

Update on 1/9/17:
- function freqn variable changed back to float (from double) to avoid some simulation error
- currently only autostem and atompot can be compiled, probe, autoslic needs to be adapted to he new chi function
- this version doesn't include sensitivity map yet, sensitivity map version can be found in ACI/MultisliceCPPNew, which doesn't contain adapted chi function

Updates on 12/9/16:
-applied aberration function following Rose et al notation
-connect probe, autoslic, autostem to the new aberration function
-update k space parameters that is created by function freqn to double instead of float

part of the package can be compiled with g++ on ACI by type

	make atompot
	make autoslic
	make autostem
	make image
	make probe

currently not compatible with condor_compile due to some library problem