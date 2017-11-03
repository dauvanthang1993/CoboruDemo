###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=
LINKOPTION =

ALL : "SAMPLE32.EXE"

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE32.EXE"
	DEL "SAMPLE32.OBJ"

"SAMPLE32.OBJ" : "SAMPLE32.COB" "MAKEFILE"
	COBOL32.EXE -M $(COBFLAGS) "SAMPLE32.COB"

"SAMPLE32.EXE" : SAMPLE32.OBJ
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"SAMPLE32.EXE" \
	"SAMPLE32.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 
