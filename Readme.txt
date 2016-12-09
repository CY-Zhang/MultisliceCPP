Multislice package updated 12/9/16, cz

Updates in 12/9/16 version:
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