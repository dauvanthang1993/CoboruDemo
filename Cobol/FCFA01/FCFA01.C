/* COBOL�t�@�C���A�N�Z�X���[�`�� Copyright 1998-2015 FUJITSU LIMITED */
/* ���v���O���� fcfa01.c - �s���t�@�C���̓Ǎ��� */

#include <stdio.h>
#include "f3bifcfa.h"

/* �֐��̎��s���s����p�萔 */
#define FAILED -1

/* while()���[�v�p�萔 */
#define TRUE 1

/* SRC���璷��LEN�̗̈�����o���Ė�����'\0'��t����DST�ɕ��� */
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

/* �����̍s���t�@�C������̓I�[�v������ */
  fname = argv[1]; /* �R�}���h���C���̑����� */
  flags = FA_LSEQFILE | FA_INPUT | FA_VARLEN |
          FA_EXCLLOCK;
 /* �s���t�@�C���̓L�[�\����K�v�Ƃ��Ȃ� */
  keylist = (struct fa_keylist *)NULL;
  reclen = 80;
  fd = cobfa_open(fname, flags, keylist, reclen);
  eno = cobfa_errno();
  stat = cobfa_stat();

/* �I�[�v�����̃G���[���� */
  if (fname == NULL)
  {
    fname = "(null)";
  }
  if (fd == FAILED)
  {
    switch (eno)
    {
      case FA_EFLOCKED:
        printf("�t�@�C��: %s �����̃v���Z�X�ɂ���ă��b�N����Ă��܂��B\n"
               "�܂���Ŏ����Ă��������B\n", fname);
        break;
      case FA_EFNAME:
        if (stat == 35) /* ���o�͏�� 35: �t�@�C����������Ȃ� */
        {
          printf("�t�@�C��: %s ��������܂���ł����Bstat: 35.\n", fname);
        }
        else /* ���̑��̃G���[ */
        {
          printf("�t�@�C��: %s ���I�[�v���ł��܂���ł����Bstat: %02d.\n",
                 fname, stat);
        }
        break;
      default: /* cobfa_open()�֐��̈����Ɉُ킪������ */
        printf("�G���[�����o���܂����Berrno: %d, stat: %02d\n",
               eno, stat);
    }
    exit (1);
  }

/* ���R�[�h��ǂݍ��݁A�\������ */
  while (TRUE)
  {
    flags = FA_NEXT;
    ret = cobfa_rdnext(fd, flags, recarea);
    if (ret == FAILED) break; /* FA_EENDFILE�����o����Astat:10���Ԃ����͂��B*/
    reclen = cobfa_reclen();

    cutback(recarea, cobfa_reclen(), buff);
    printf("����:%2d, ���e:'%s'\n", reclen, buff);
  }

/* �t�@�C������� */
  cobfa_close(fd);

  exit (0);
}