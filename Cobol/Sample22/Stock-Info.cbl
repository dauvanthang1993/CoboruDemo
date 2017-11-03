000100**************************************************************************
000200**  Copyright 1999-2015 FUJITSU LIMITED
000300**
000400**    Stock-Info.cbl
000500**
000600**************************************************************************
000700 01  stockInfo.
000800     02 stockQuantity             pic 9(04) comp-5.
000900     02 stockData occurs 20 times indexed by stockIndex.
001000        03 stockProductNumber     pic X(10).
001100        03 filler                 pic X(02).
001200        03 stockProductQuantity   pic 9(10).
