000010* Copyright 1999-2015 FUJITSU LIMITED
000020  01 orderSheet.
000030   02 orderer          pic X(32).
000040   02 receiptNumber    pic X(12). 
000050   02 receiptDate      pic X(14).
000060   02 Date-R  REDEFINES receiptDate.
000070     03 receiptYear    pic X(04).
000080     03 receiptMonth   pic X(02).
000090     03 receiptDay     pic X(02).
000100     03 receiptHour    pic X(02).
000110     03 receiptMin     pic X(02).
000120     03 receiptSec     pic X(02).
000130   02 receiptQuantity  pic S9(04) comp-5.
000140   02 receiptRec.
000150    03                 occurs 20 times.
000160     04 R-NUM           pic X(10).
000170     04 R-Name          pic X(32).
000180     04 R-Model         pic X(32).
000190     04 R-Price         pic 9(10).
000200     04 ED-R-Price REDEFINES R-Price
000210                        pic Z(9)9.
000220     04 R-QUANT         pic 9(10).
000230     04 ED-R-QUANT REDEFINES R-QUANT
000240                        pic Z(9)9.
000250     04 SUM-Price       pic 9(10).
000260     04 ED-SUM-Price REDEFINES SUM-Price
000270                        pic Z(9)9.
000280
000290 01 ordererPassword    pic X(32).
000300 01 ALLquantity        pic 9(10).
000310 01 EDIT-DATA.
000320  02 ED-ALLquantity    pic Z(9)9.
000330  02 ED-Bill           pic Z(9)9.
