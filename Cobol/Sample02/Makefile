###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=
LINKOPTION =

ALL : SAMPLE2.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE2.EXE"
	DEL "SAMPLE2.OBJ"
	DEL "MASTER"
	DEL "MASTER.A"
	DEL "MASTER.B"

"SAMPLE2.OBJ" : "SAMPLE2.COB" "SYOHINM.CBL" "MAKEFILE"
	COBOL32.EXE -M -I.\ $(COBFLAGS) "SAMPLE2.COB"

"SAMPLE2.EXE" : "SAMPLE2.OBJ"
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"SAMPLE2.EXE" \
	"SAMPLE2.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

