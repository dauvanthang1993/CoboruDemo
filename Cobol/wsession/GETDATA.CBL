000010**************************************************************************
000020**  Copyright 2000-2015 FUJITSU LIMITED
000030**
000040**    GETDATA.CBL
000050**
000060**************************************************************************
000070 01  GETDATA.
000080     02 G-USERID                    PIC X(32).
000090     02 G-OLDBALANCE                PIC \\,\\\,\\\,\\\,\\\,\\9.
000100     02 G-TRADE                     PIC X(01).
000110        88 G-DEPOSIT                VALUE "0".
000120        88 G-REPAYMENT              VALUE "1".
000130     02 G-MONEY                     PIC \\,\\\,\\\,\\\,\\\,\\9.
000140     02 G-NEWBALANCE                PIC \\,\\\,\\\,\\\,\\\,\\9.
