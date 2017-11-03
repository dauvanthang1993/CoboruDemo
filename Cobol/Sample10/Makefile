###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=-WC,MAIN(WINMAIN)
LINKOPTION =

ALL : SAMPLE10.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE10.EXE"
	DEL "SAMPLE10.OBJ"

"SAMPLE10.OBJ" : "SAMPLE10.COB" "..\SAMPLE02\SYOHINM.CBL" "URIAGE.CBL" "Syuukei.pmd" "MAKEFILE"
	COBOL32.EXE -I.\ -I..\SAMPLE02\ $(COBFLAGS) -M "SAMPLE10.COB"

"SAMPLE10.EXE" : "SAMPLE10.OBJ"
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"SAMPLE10.EXE" \
	"SAMPLE10.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

