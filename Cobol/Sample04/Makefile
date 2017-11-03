###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=
LINKOPTION =

ALL : SAMPLE4.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE4.EXE"
	DEL "SAMPLE4.OBJ"

"SAMPLE4.OBJ" : "SAMPLE4.COB" "MAKEFILE"
	COBOL32.EXE -M $(COBFLAGS) "SAMPLE4.COB"

"SAMPLE4.EXE" : "SAMPLE4.OBJ"
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"SAMPLE4.EXE" \
	"SAMPLE4.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

