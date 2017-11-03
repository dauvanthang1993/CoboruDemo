###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=
LINKOPTION =

ALL : SAMPLE8.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE8.EXE"
	DEL "SAMPLE8.OBJ"


"SAMPLE8.OBJ" : "SAMPLE8.COB" "MAKEFILE"
	COBOL32.EXE $(COBFLAGS) -M "SAMPLE8.COB"

"SAMPLE8.EXE" : "SAMPLE8.OBJ"
	LINK.EXE $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"SAMPLE8.EXE" \
	"SAMPLE8.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

