000100**************************************************************************
000200**  Copyright 1999-2015 FUJITSU LIMITED
000300**
000400**    Order-Info.cbl
000500**
000600**************************************************************************
000700 01  orderInfo.
000800     02 orderNumber               pic X(12).
000900     02 orderUserID               pic X(32).
001000     02 orderDate.
001100        03 orderYear              pic X(04).
001200        03 orderMonth             pic X(02).
001300        03 orderDay               pic X(02).
001400        03 orderHour              pic X(02).
001500        03 orderMin               pic X(02).
001600        03 orderSec               pic X(02).
001700     02 orderQuantity             pic 9(04) comp-5.
001800     02 orderData occurs 20 times indexed by orderIndex.
001900        03 orderProductNumber     pic X(10).
002000        03 filler                 pic X(02).
002100        03 orderProductQuantity   pic 9(10).
