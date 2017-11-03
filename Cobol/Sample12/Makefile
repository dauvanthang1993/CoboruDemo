###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=
LINKOPTION =

ALL : SAMPLE12.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE12.EXE"
	DEL "SAMPLE12.OBJ"

"SAMPLE12.OBJ" : "SAMPLE12.COB" "MAKEFILE"
	COBOL32.EXE $(COBFLAGS) -M "SAMPLE12.COB"

"SAMPLE12.EXE" : "SAMPLE12.OBJ"
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"SAMPLE12.EXE" \
	"SAMPLE12.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

