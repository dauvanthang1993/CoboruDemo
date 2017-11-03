PROJ = fcfa02

CDIR = c:\msdev
COBDIR = c:\cobol

CBIN = $(CDIR)\bin

CC = $(CBIN)\cl
LINK = $(CBIN)\link

CFLAGS = /c /Od /Zi
#CFLAGS = /c /Ox

LKFLAGS = kernel32.lib libcmt.lib\
	/machine:x86

COBINC = /I $(COBDIR)

all:	$(PROJ).exe

$(PROJ).obj:	$(PROJ).c	# $(PROJ).h
	$(CC) $(CFLAGS) $(COBINC) $(PROJ).c

$(PROJ).exe:	$(PROJ).obj
	$(LINK) $(LKFLAGS) $(PROJ).obj $(COBDIR)\f3bifcfa.lib
