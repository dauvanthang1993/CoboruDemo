000010*>
000020 IDENTIFICATION DIVISION.
000030 PROGRAM-ID.   CheckRecord.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000072 01 LIST.			
000073 		02 LIST-AMPE PIC X(12) VALUE "152025304050".
000074 		02 AMPES	REDEFINES  LIST-AMPE  PIC 99 OCCURS 6 TIMES.
000075 		02 LIST-CATEGORY		PIC X(3)  VALUE "ACD".	 	 
000076 		02 CATEGORIES	REDEFINES  LIST-CATEGORY PIC X OCCURS 3 TIMES.
000077 
000078 		
000079 01 COUNT-ARRAY.
000080 		02 COUNT-AMPE	PIC 9.
000081 		02 COUNT-CATE	PIC 9.	
000082 		
000083 01 CHECK.
000084 		02 CHECK-AMPE	PIC X.
000085 		02 CHECK-CATE	PIC X.
000086 				
000087 		
000088 LINKAGE SECTION.
000089 01 BILL-INPUTL.
000090 		02 BILL-IDL		PIC X(5).
000091 		02 AMPEL		PIC X(2).
000092 		02 PRE-MONTHL 	PIC X(4).
000093 		02 CUR-MONTHL	PIC X(4).
000094 		02 CATEGORYL	PIC X(1).
000095 		02 ENDEDL		PIC X(1).
000096 		02 				PIC X(63).				
000097 01 CHECKL PIC X. 
000098 	
000099	
000100 PROCEDURE DIVISION USING BILL-INPUTL CHECKL.
000101******リコードをチェックする********* 
000102 CHECK-RECORD.
000103 		PERFORM CHECK-AMPEF
000104 		PERFORM CHECK-CATEGORYF
000105 		IF BILL-IDL IS NUMERIC AND 100001 <= BILL-IDL AND BILL-IDL <= 79999 AND 
000106 		PRE-MONTHL IS NUMERIC AND CUR-MONTHL IS NUMERIC AND PRE-MONTHL <= CUR-MONTHL
000107 		AND ENDEDL = "*"  AND CHECK-AMPE = "T" AND CHECK-CATE = "T"
000108 		THEN
000109 			MOVE "T" TO CHECKL
000112 		ELSE
000113 		    MOVE "F" TO CHECKL
000114 		END-IF
000115 		EXIT PROGRAM.
000116 END-CHECK-RECORD.
000117*
000118*****アンペをチェックする*********** 
000119 CHECK-AMPEF.
000120 		MOVE "F" TO CHECK-AMPE
000121 		PERFORM VARYING COUNT-AMPE FROM 1 BY 1 UNTIL COUNT-AMPE > 6
000122 			IF AMPEL = AMPES(COUNT-AMPE) THEN
000123 			    MOVE "T" TO CHECK-AMPE
000124 			    EXIT PERFORM
000125 			END-IF
000126 		END-PERFORM.
000129* 		
000130******区分コードをチェックする******* 		
000131  CHECK-CATEGORYF.
000132  	MOVE "F" TO CHECK-CATE
000133 		PERFORM VARYING COUNT-CATE FROM 1 BY 1 UNTIL COUNT-CATE > 3
000134 			IF CATEGORYL = CATEGORIES(COUNT-CATE) THEN
000135 			    MOVE "T" TO CHECK-CATE
000136 			    EXIT PERFORM
000137 			END-IF
000138 		END-PERFORM.			
000142 END-CHECK-AMPE.
000143*
000150 END PROGRAM CheckRecord.