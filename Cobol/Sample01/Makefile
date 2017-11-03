###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=-WC,"TEST"
LINKOPTION =

ALL : DBGSAMP1.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "DBGSAMP1.EXE"
	DEL "DBGSAMP1.PDB"
	DEL "DBGSAMP1.ILK"
	DEL "SAMPLE1.OBJ"
	DEL "SAMPLE1.SVD"

"SAMPLE1.OBJ" : "SAMPLE1.cob" "MAKEFILE"
	COBOL32.EXE -M $(COBFLAGS) "SAMPLE1.COB"

DBGSAMP1.EXE : Sample1.OBJ
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/DEBUG \
	/OUT:"DBGSAMP1.EXE" \
	"SAMPLE1.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

