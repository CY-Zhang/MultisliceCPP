#
# makefile to generate TEMSIM multislice package.
#
# Put this file in the same directory as the TEMSIM
# C source files and type "make all" from a command line,
# to compile all of the programs.
#
#  type "make all" to compile everthing
#  type "make remove" to remove all of the compiled files.
#
# Each file name is assumed to be all lower case.
#
# last modified 02-27-17 cz
#

# define compiler with optimize flag
#CC = gcc -ansi -pedantic -O 		# original
CC = g++
#DEL = del  # windows/mingw - doesn't work without .exe in file name
DEL = rm  # unix

# define libraries
MYLIBS = slicelib.o floatTIFF.o cfpix.o 
LIBS = ${MYLIBS}$
WLIBS = slicelib.o floatTIFF.o cfpix.o -lfftw3f_threads -lfftw3f

#
#  entry point to build everything
#
all:
	make atompot
	make autoslic
#	make display
	make image
	make mulslice
	make probe
#	make slicview
	make stemslic
	make sumpix
	make autostem
	make autocbed
#	make ktiff2dm
#	make autowave
#	make autopacbed
#
#  entry point to remove compiled files
#
remove:
	${DEL}$ atompot
	${DEL}$ autoslic
#	${DEL}$ display
	${DEL}$ image
	${DEL}$ mulslice
	${DEL}$ probe
#	${DEL}$ slicview
	${DEL}$ stemslic
	${DEL}$ sumpix
	${DEL}$ autostem
#	${DEL}$ autowave
	${DEL}$ cfpix.o
	${DEL}$ slicelib.o
	${DEL}$ floatTIFF.o
#	${DEL}$ autopacbed
#	${DEL}$ autostem
#	${DEL}$ writegfx.o
#
#  main programs
#

atompot: atompot.cpp  ${MYLIBS}
	${CC} -o atompot atompot.cpp ${WLIBS}

autoslic: autoslic.cpp autosliccmd.cpp ${MYLIBS}
	${CC} -fopenmp -o autoslic autosliccmd.cpp autoslic.cpp ${WLIBS}

autostem: autostem.cpp autostemcmd.cpp ${MYLIBS}
	${CC} -fopenmp -o autostem autostemcmd.cpp autostem.cpp ${WLIBS} 

autocbed: autocbed.cpp autocbedcmd.cpp ${MYLIBS}
	${CC} -fopenmp -o autocbed autocbedcmd.cpp autocbed.cpp ${WLIBS}

display: display.cpp  ${MYLIBS}
	${CC} -o display display.cpp ${WLIBS}

image: image.cpp  ${MYLIBS}
	${CC} -o image image.cpp ${WLIBS}

incostem: incostem.cpp incostemcmd.cpp ${MYLIBS}
	${CC} -fopenmp -o incostem incostemcmd.cpp incostem.cpp probe.cpp ${WLIBS}

mulslice: mulslice.cpp ${MYLIBS}
	${CC} -o mulslice mulslice.cpp ${WLIBS}

probe: probe.cpp probecmd.cpp ${MYLIBS}
	${CC} -o probe probecmd.cpp probe.cpp ${WLIBS}

slicview: slicview.cpp ${MYLIBS}
	${CC} -o slicview slicview.cpp ${WLIBS}

stemslic: stemslic.cpp ${MYLIBS}
	${CC} -o stemslic stemslic.cpp ${WLIBS}$

sumpix: sumpix.cpp ${MYLIBS}
	${CC} -o sumpix sumpix.cpp ${WLIBS}

#
# define subroutine library
#

cfpix.o: cfpix.cpp
	${CC} -c cfpix.cpp

slicelib.o: slicelib.cpp
	${CC} -c slicelib.cpp

floatTIFF.o: floatTIFF.cpp
	${CC} -c floatTIFF.cpp

writegfx.o: writegfx.c
	${CC} -c writegfx.c
