/* COBOLファイルアクセスルーチン Copyright 1998-2015 FUJITSU LIMITED */
/* 例題プログラム fcfa02.c - */
/*   行順ファイルの読込みと索引ファイルの書出し */

#include <stdio.h>
#include <memory.h>
#include "f3bifcfa.h"

/* 関数の実行失敗判定用定数 */
#define FAILED -1

/* while()ループ用定数 */
#define TRUE 1

/* 後方空白付きの固定領域からヌル終端文字列に複写 */
#define ldchar(SRC, LEN, DST) \
  { \
    int i; char c; \
    for (i = 0; i < (LEN); i ++){ \
      ((char *)(DST))[i] = ((char *)(SRC))[i]; \
    } \
    ((char *)(DST))[i] = '\0'; \
    for (i --; i >= 0; i --){ \
      if (((char *)(DST))[i] != ' ') break; \
      ((char *)(DST))[i] = '\0'; \
    } \
  }

/* ヌル終端文字列から後方空白付きの固定領域に複写 */
#define stchar(DST, SRC, LEN) \
  { \
    int i; char c; \
    for (i = 0; i < (LEN) && (c = ((char *)(SRC))[i]) != '\0'; i ++){ \
      ((char *)(DST))[i] = c; \
    } \
    for (; i < (LEN); i ++) ((char *)(DST))[i] = ' '; \
  }

int main()
{
  char buff[255], recarea[26], *fname;
  long fd_lseq, fd_idx;
  long flags, reclen, effkeylen, keynum, ret;
  struct fa_keylist *keylist, klist;
  struct fa_keydesc prime, alter1, alter2;

/* 'lseq'ファイルのレコード内データ構造: */
/*             1111111111222222 */
/*  +01234567890123456789012345 */
/*   99BxxxxxxxxxxxByyyyyy...yB */
/*    1 outdoors    okugai      */
  struct {
    char lineno  [ 2]; /* オリジナル行番号領域 */
    char filler1 [ 1];
    char english [11]; /* 英単語領域 */
    char filler2 [ 1];
    char japanese[10]; /* 日本語の単語領域 */
    char filler3 [ 1];
  } rec_lseq;

/* 'idx'ファイルのレコード内データ構造: */
/*             1111111111222222..3 */
/*  +01234567890123456789012345..4 */
/*   xxxxxxxxxxxyyyyyyyyyy99BBB..B */
/*   outdoors   okugai     1       */
/*   +-主キー -++副キー1-+++ <==副キー2 */
  struct {
    char english [11]; /* 英単語領域 */
    char japanese[10]; /* 日本語の単語領域 */
    char lineno  [ 2]; /* オリジナル行番号領域 */
    char filler  [10];
  } rec_idx;


/* 既存の'lseq'ファイルを入力オープンする */
  fname = "fcfa02.inp";
  flags = FA_LSEQFILE | FA_INPUT | FA_VARLEN |
          FA_EXCLLOCK;

 /* 行順ファイルはキー構造を必要としない */
  keylist = (struct fa_keylist *)NULL;
  reclen = sizeof(rec_lseq);
  fd_lseq = cobfa_open(fname, flags, keylist, reclen);

/* エラー処理 */
  if (fd_lseq == FAILED) {
    printf("行順ファイル: %s の入力オープンに失敗しました。\n", fname);
    exit (1);
  }

/** キー構造の定義 **/
/* ファイル中のキー群全体 */
  klist.kl_nkeys = 3; /* 3つのキーあり */
  klist.kl_key[0] = &prime;  /* 主レコードキー */
  klist.kl_key[1] = &alter1; /* 副レコードキー(#1) */
  klist.kl_key[2] = &alter2; /* 副レコードキー(#2) */

/* 主レコードキー: 英単語領域 */
  prime.k_flags = FA_NODUPS; /* 重複なし */
  prime.k_nparts = 1; /* キーパートの数: 1 */
  prime.k_part[0].kp_start = 0; /* レコード域の先頭 */
  prime.k_part[0].kp_leng  = sizeof(rec_idx.english);

/* 副レコードキー(#1): 日本語の単語領域 */
  alter1.k_flags = FA_NODUPS; /* 重複なし */
  alter1.k_nparts = 1; /* キーパートの数: 1 */
 /* 英単語領域の後ろ */
  alter1.k_part[0].kp_start = 0 + sizeof(rec_idx.english);
  alter1.k_part[0].kp_leng  = sizeof(rec_idx.japanese);

/* 副レコードキー(#2): オリジナル行番号領域 */
  alter2.k_flags = FA_NODUPS; /* 重複なし */
  alter2.k_nparts = 1; /* キーパートの数: 1 */
 /* 英単語領域と日本語の単語の領域の後ろ */
  alter2.k_part[0].kp_start = 0 + sizeof(rec_idx.english) +
                                  sizeof(rec_idx.japanese);
  alter2.k_part[0].kp_leng  = sizeof(rec_idx.lineno);

/* 索引ファイルの創成 */
  fname = "fcfa02.idx";
  flags = FA_IDXFILE | FA_OUTPUT | FA_VARLEN |
          FA_RNDACC | FA_EXCLLOCK | FA_NOTOPT;
  keylist = &klist;
  reclen = sizeof(rec_idx);
  fd_idx = cobfa_open(fname, flags, keylist, reclen);

/* エラー処理 */
  if (fd_idx == FAILED)
  {
    printf("索引ファイル: %s の創成に失敗しました。\n", fname);
    cobfa_close(fd_lseq);
    exit (1);
  }

/* レコードを読み込み、'lseq'の各領域を'idx'の領域に転記して書き込む */
  while (TRUE)
  {
    flags = FA_NEXT | FA_NOLOCK;
    ret = cobfa_rdnext(fd_lseq, flags, (char *)(&rec_lseq));
    if (ret == FAILED) break; /* FA_EENDFILEが検出され、stat:10が返ったはず。*/

    memset((char *)(&rec_idx), ' ', sizeof(rec_idx));
    memcpy(rec_idx.lineno,   rec_lseq.lineno,   sizeof(rec_idx.lineno));
    memcpy(rec_idx.english,  rec_lseq.english,  sizeof(rec_idx.english));
    memcpy(rec_idx.japanese, rec_lseq.japanese, sizeof(rec_idx.japanese));
    ret = cobfa_wrkey(fd_idx, (char *)(&rec_idx), sizeof(rec_idx));
  }

/* ファイルを閉じる */
  cobfa_close(fd_lseq); /* 行順ファイル:'lseq'を閉じる */
  cobfa_close(fd_idx);  /* 索引ファイル:'idx'を閉じる */


/* 索引ファイルを再びオープンする */
  flags = FA_IDXFILE | FA_INPUT | FA_VARLEN |
          FA_SEQACC | FA_AUTOLOCK | FA_NOTOPT;
  reclen = sizeof(rec_idx);
  fd_idx = cobfa_open(fname, flags, keylist, reclen);

/* エラー処理 */
  if (fd_idx == FAILED)
  {
    printf("索引ファイル: %s がオープンできませんでした。\n", fname);
    exit (1);
  }

/* 主キーで以て先頭のレコードに位置決めする */
  flags = FA_FIRST;
  keynum = 0; /* キー番号は使用しない */
  effkeylen = 0; /* 主キーの全長 */
  ret = cobfa_stkey(fd_idx, flags, (char *)NULL, &prime, keynum, effkeylen);

/* レコードを読み込み、表示する */
  while (TRUE)
  {
    int fldlen;

    flags = FA_NEXT;
    ret = cobfa_rdnext(fd_idx, flags, (char *)(&rec_idx));
    if (ret == FAILED) break; /* FA_EENDFILEが検出され、stat:10が返ったはず。*/

    ldchar(rec_idx.lineno, sizeof(rec_idx.lineno), buff);
    printf("元の行番号:%s, ", buff);

    ldchar(rec_idx.english, sizeof(rec_idx.english), buff);
    printf("英語: %s,\t", buff);

    ldchar(rec_idx.japanese, sizeof(rec_idx.japanese), buff);
    printf("日本語: %s.\n", buff);
  }

/* ファイルを閉じる */
  cobfa_close(fd_idx);

  exit (0);
}
