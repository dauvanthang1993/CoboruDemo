000100**************************************************************************
000200**  Copyright 1999-2015 FUJITSU LIMITED
000300**
000400**    Product-Info.cbl
000500**
000600**************************************************************************
000700 01  productInfo.
000800     02 productQuantity           pic 9(04) comp-5.
000900     02 productData occurs 20 times indexed by productIndex.
001000        03 productNumber          pic X(12).
001100        03 productName            pic X(32).
001200        03 productModel           pic X(32).
001300        03 productPrice           pic 9(09).
