###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=-WC,ENCODE(UTF8,UTF16,LE),NSP
LINKOPTION =

ALL : SAMPLE33.EXE

REBUILD : CLEAN ALL
CLEAN :
	DEL "SAMPLE33.EXE"
	DEL "SAMPLE33.OBJ"

"SAMPLE33.OBJ" : "SAMPLE33.COB" "MAKEFILE"
	COBOL32.EXE $(COBFLAGS) -M  "SAMPLE33.COB"

"SAMPLE33.EXE" : "SAMPLE33.OBJ"
	"LINK.EXE" $(LINKOPTION) \
	/SUBSYSTEM:WINDOWS,5.01 \
	/OUT:"SAMPLE33.EXE" \
	"SAMPLE33.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" 

