###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=
LINKOPTION =

ALL : SAMPLE11.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE11.EXE"
	DEL "SAMPLE11.OBJ"

"SAMPLE11.OBJ" : "SAMPLE11.COB" "MAKEFILE"
	COBOL32.EXE $(COBFLAGS) -M "SAMPLE11.COB"

"SAMPLE11.EXE" : "SAMPLE11.OBJ"
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"SAMPLE11.EXE" \
	"SAMPLE11.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

