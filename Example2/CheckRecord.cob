000010*>
000020 IDENTIFICATION DIVISION.
000030 PROGRAM-ID.   CheckCorrect.
000040 ENVIRONMENT    DIVISION.
000050 CONFIGURATION  SECTION.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000071 01 THANG PIC X(2).
000072 LINKAGE SECTION.
000073  01 BILL-INPUT.
000074 		02 BILL-ID		PIC X(5).
000075 		02 AMPE			PIC X(2).
000076 		02 PRE-MONTH 	PIC X(4).
000077 		02 CUR-MONTH	PIC X(4).
000078 		02 CATEGORY		PIC X(1).
000079 	01 CHECK-RECORD PIC X. 	
000080 PROCEDURE DIVISION.
000090 CHECK-RECORD.
000091 		IF BILL-ID IS NUMERIC THEN
000092 		    Statement-1
000093 		ELSE
000094 		    Statement-2
000095 		END-IF
000097 END-CHECK-RECORD.
000098 
000099 STOP-PROGRAM.
000100 		EXIT PROGRAM.
000101 END-STOP-PROGRAM.
000110 END PROGRAM CheckCorrect.