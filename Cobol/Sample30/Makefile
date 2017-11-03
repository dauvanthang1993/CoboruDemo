###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=-WC,ENCODE(UTF8,UTF16,LE),NSP
LINKOPTION =

ALL : SAMPLE30.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE30.EXE"
	DEL "SAMPLE30.OBJ"

"SAMPLE30.OBJ" : "SAMPLE30.COB" "MAKEFILE"
	COBOL32.EXE $(COBFLAGS) -M  "SAMPLE30.COB"

"SAMPLE30.EXE" : "SAMPLE30.OBJ"
	"LINK.EXE" $(LINKOPTION) \
	/SUBSYSTEM:WINDOWS,5.01 \
	/OUT:"SAMPLE30.EXE" \
	"SAMPLE30.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

