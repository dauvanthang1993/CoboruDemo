###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=-WC,MAIN(MAIN)
LINKOPTION =

ALL : SAMPLE6.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE6.EXE"
	DEL "SAMPLE6.OBJ"

"SAMPLE6.OBJ" : "SAMPLE6.COB" "MAKEFILE"
	COBOL32.EXE $(COBFLAGS) -M  "SAMPLE6.COB"

"SAMPLE6.EXE" : "SAMPLE6.OBJ"
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"SAMPLE6.EXE" \
	"SAMPLE6.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

