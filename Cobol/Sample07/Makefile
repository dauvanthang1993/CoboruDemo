###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=
LINKOPTION =

ALL : SAMPLE7.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE7.EXE"
	DEL "SAMPLE7.OBJ"

"SAMPLE7.OBJ" : "SAMPLE7.COB" "..\SAMPLE02\SYOHINM.CBL" "MAKEFILE"
	COBOL32.EXE -I.\ -I..\SAMPLE02\ -m .\ $(COBFLAGS) -M "SAMPLE7.COB"

"SAMPLE7.EXE" : "SAMPLE7.OBJ"
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"SAMPLE7.EXE" \
	"SAMPLE7.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

