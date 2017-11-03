###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=
LINKOPTION =

ALL : SAMPLE9.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE9.EXE"
	DEL "SAMPLE9.OBJ"

"SAMPLE9.OBJ" : "SAMPLE9.COB" "MAKEFILE"
	COBOL32.EXE $(COBFLAGS) -M "SAMPLE9.COB"

"SAMPLE9.EXE" : "SAMPLE9.OBJ"
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"SAMPLE9.EXE" \
	"SAMPLE9.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

