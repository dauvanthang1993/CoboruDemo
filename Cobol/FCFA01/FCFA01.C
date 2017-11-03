/* COBOLファイルアクセスルーチン Copyright 1998-2015 FUJITSU LIMITED */
/* 例題プログラム fcfa01.c - 行順ファイルの読込み */

#include <stdio.h>
#include "f3bifcfa.h"

/* 関数の実行失敗判定用定数 */
#define FAILED -1

/* while()ループ用定数 */
#define TRUE 1

/* SRCから長さLENの領域を取り出して末尾に'\0'を付けてDSTに複写 */
#define cutback(SRC, LEN, DST) \
  { \
    int i; char c; \
    for (i = 0; i < (LEN); i ++){ \
      ((char *)(DST))[i] = ((char *)(SRC))[i]; \
    } \
    ((char *)(DST))[i] = '\0'; \
  }

int main(int argc, char *argv[])
{
  char buff[255], recarea[80], *fname;
  long ret, fd, flags, reclen, stat, eno;
  struct fa_keylist *keylist;

/* 既存の行順ファイルを入力オープンする */
  fname = argv[1]; /* コマンドラインの第一引数 */
  flags = FA_LSEQFILE | FA_INPUT | FA_VARLEN |
          FA_EXCLLOCK;
 /* 行順ファイルはキー構造を必要としない */
  keylist = (struct fa_keylist *)NULL;
  reclen = 80;
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
    switch (eno)
    {
      case FA_EFLOCKED:
        printf("ファイル: %s が他のプロセスによってロックされています。\n"
               "また後で試してください。\n", fname);
        break;
      case FA_EFNAME:
        if (stat == 35) /* 入出力状態 35: ファイルが見つからない */
        {
          printf("ファイル: %s が見つかりませんでした。stat: 35.\n", fname);
        }
        else /* その他のエラー */
        {
          printf("ファイル: %s がオープンできませんでした。stat: %02d.\n",
                 fname, stat);
        }
        break;
      default: /* cobfa_open()関数の引数に異常があった */
        printf("エラーを検出しました。errno: %d, stat: %02d\n",
               eno, stat);
    }
    exit (1);
  }

/* レコードを読み込み、表示する */
  while (TRUE)
  {
    flags = FA_NEXT;
    ret = cobfa_rdnext(fd, flags, recarea);
    if (ret == FAILED) break; /* FA_EENDFILEが検出され、stat:10が返ったはず。*/
    reclen = cobfa_reclen();

    cutback(recarea, cobfa_reclen(), buff);
    printf("長さ:%2d, 内容:'%s'\n", reclen, buff);
  }

/* ファイルを閉じる */
  cobfa_close(fd);

  exit (0);
}
