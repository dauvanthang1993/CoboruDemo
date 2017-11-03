/* COBOLファイルアクセスルーチン Copyright 1998-2015 FUJITSU LIMITED */
/* 例題プログラム fcfa03.c - 索引ファイルの情報の取得 */

#include <stdio.h>
#include "f3bifcfa.h"

/* 関数の実行失敗判定用定数 */
#define FAILED -1

/* 索引ファイル情報の取得のための機能コード */
#define DICTINFO 0
#define PRIME    1

int main(int argc, char *argv[])
{
  char *fname;
  long fd, eno, stat;
  long flags, reclen, ret;
  long nkeys, keynum, nparts, partnum;
  struct fa_keylist *keylist;
  struct fa_keydesc keydesc;
  struct fa_dictinfo dictinfo;

/* キー構造が不明な既存の索引ファイルを入力オープンする */
  fname = argv[1]; /* コマンドラインの第一引数 */
 /* レコード形式はオープン時に認識される */
  flags = FA_IDXFILE | FA_INPUT | FA_AUTOLOCK;
 /* 索引ファイルのオープンで、keylist構造体ポインタが */
 /* NULLの場合、キー構造はオープン時に認識される      */
  keylist = (struct fa_keylist *)NULL;
 /* レコード長は、オープン時に認識される */
  reclen = 0;
  fd = cobfa_open(fname, flags, keylist, reclen);
  eno = cobfa_errno();
  stat = cobfa_stat();

/* オープン時のエラー処理 */
  if (fname == NULL)
  {
    fname = "(null)";
  }
  if (fd == FAILED)
  {
    if (eno == FA_EBADFILE)
    {
      printf("ファイル: %s は索引ファイルでないか、"
             "破壊されている索引ファイルです。stat:%02d\n", fname, stat);
    }
    else
    {
      printf("ファイル: %s がオープンできませんでした。errno: %d, stat: %02d\n",
             fname, eno, stat);
    }
    exit (1);
  }

/* 索引ファイルの情報を表示 */
  printf("索引ファイル情報\n");
  printf(" ファイル名: %s\n", fname);

  keynum = DICTINFO;
  ret = cobfa_indexinfo(fd, (struct fa_keydesc *)(&dictinfo), keynum);

  printf("  fa_dictinfo.di_flags   (レコード形式:固定/可変)  : %s\n",
         (dictinfo.di_flags & FA_FIXLEN) ? "FA_FIXLEN" : "FA_VARLEN");

  printf("  fa_dictinfo.di_recsize (固定/最大レコード長)     : %d\n",
         dictinfo.di_recsize);

  printf("  fa_dictinfo.di_idxsize (レコードキーの総長)      : %d\n",
         dictinfo.di_idxsize);

  nkeys = dictinfo.di_nkeys;
  printf("  fa_dictinfo.di_nkeys   (キーが定義されている数)  : %d\n",
         nkeys);

/* 各キーの表示 */
  for (keynum = PRIME; keynum <= nkeys; keynum ++)
  {
    printf("  keynum %3d: (fa_keylist.kl_key[%3d] ... %sレコードキー)\n",
           keynum, keynum - 1, keynum == PRIME ? "主" : "副");

    ret = cobfa_indexinfo(fd, &keydesc, keynum);

    printf("   fa_keydesc.k_flags    (重複可能か否か)             : %s\n",
           (keydesc.k_flags & FA_DUPS) ? "FA_DUPS" : "FA_NODUPS");

    nparts = keydesc.k_nparts;
    printf("   fa_keydesc.k_nparts   (キーパートの数)             : %d\n",
           nparts);

  /* 各キーパートの表示 */
    for (partnum = 0; partnum < nparts; partnum ++)
    {
      printf("    fa_keydesc.k_part[%3d].kp_start (先頭からの変位): %d\n",
             partnum, keydesc.k_part[partnum].kp_start);

      printf("    fa_keydesc.k_part[%3d].kp_leng  (キーパート長)  : %d\n",
             partnum, keydesc.k_part[partnum].kp_leng);
    }
  }

/* ファイルを閉じる */
  cobfa_close(fd);

  exit (0);
}
