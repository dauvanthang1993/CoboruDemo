/* COBOL�t�@�C���A�N�Z�X���[�`�� Copyright 1998-2015 FUJITSU LIMITED */
/* ���v���O���� fcfa02.c - */
/*   �s���t�@�C���̓Ǎ��݂ƍ����t�@�C���̏��o�� */

#include <stdio.h>
#include <memory.h>
#include "f3bifcfa.h"

/* �֐��̎��s���s����p�萔 */
#define FAILED -1

/* while()���[�v�p�萔 */
#define TRUE 1

/* ����󔒕t���̌Œ�̈悩��k���I�[������ɕ��� */
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

/* �k���I�[�����񂩂����󔒕t���̌Œ�̈�ɕ��� */
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

/* 'lseq'�t�@�C���̃��R�[�h���f�[�^�\��: */
/*             1111111111222222 */
/*  +01234567890123456789012345 */
/*   99BxxxxxxxxxxxByyyyyy...yB */
/*    1 outdoors    okugai      */
  struct {
    char lineno  [ 2]; /* �I���W�i���s�ԍ��̈� */
    char filler1 [ 1];
    char english [11]; /* �p�P��̈� */
    char filler2 [ 1];
    char japanese[10]; /* ���{��̒P��̈� */
    char filler3 [ 1];
  } rec_lseq;

/* 'idx'�t�@�C���̃��R�[�h���f�[�^�\��: */
/*             1111111111222222..3 */
/*  +01234567890123456789012345..4 */
/*   xxxxxxxxxxxyyyyyyyyyy99BBB..B */
/*   outdoors   okugai     1       */
/*   +-��L�[ -++���L�[1-+++ <==���L�[2 */
  struct {
    char english [11]; /* �p�P��̈� */
    char japanese[10]; /* ���{��̒P��̈� */
    char lineno  [ 2]; /* �I���W�i���s�ԍ��̈� */
    char filler  [10];
  } rec_idx;


/* ������'lseq'�t�@�C������̓I�[�v������ */
  fname = "fcfa02.inp";
  flags = FA_LSEQFILE | FA_INPUT | FA_VARLEN |
          FA_EXCLLOCK;

 /* �s���t�@�C���̓L�[�\����K�v�Ƃ��Ȃ� */
  keylist = (struct fa_keylist *)NULL;
  reclen = sizeof(rec_lseq);
  fd_lseq = cobfa_open(fname, flags, keylist, reclen);

/* �G���[���� */
  if (fd_lseq == FAILED) {
    printf("�s���t�@�C��: %s �̓��̓I�[�v���Ɏ��s���܂����B\n", fname);
    exit (1);
  }

/** �L�[�\���̒�` **/
/* �t�@�C�����̃L�[�Q�S�� */
  klist.kl_nkeys = 3; /* 3�̃L�[���� */
  klist.kl_key[0] = &prime;  /* �僌�R�[�h�L�[ */
  klist.kl_key[1] = &alter1; /* �����R�[�h�L�[(#1) */
  klist.kl_key[2] = &alter2; /* �����R�[�h�L�[(#2) */

/* �僌�R�[�h�L�[: �p�P��̈� */
  prime.k_flags = FA_NODUPS; /* �d���Ȃ� */
  prime.k_nparts = 1; /* �L�[�p�[�g�̐�: 1 */
  prime.k_part[0].kp_start = 0; /* ���R�[�h��̐擪 */
  prime.k_part[0].kp_leng  = sizeof(rec_idx.english);

/* �����R�[�h�L�[(#1): ���{��̒P��̈� */
  alter1.k_flags = FA_NODUPS; /* �d���Ȃ� */
  alter1.k_nparts = 1; /* �L�[�p�[�g�̐�: 1 */
 /* �p�P��̈�̌�� */
  alter1.k_part[0].kp_start = 0 + sizeof(rec_idx.english);
  alter1.k_part[0].kp_leng  = sizeof(rec_idx.japanese);

/* �����R�[�h�L�[(#2): �I���W�i���s�ԍ��̈� */
  alter2.k_flags = FA_NODUPS; /* �d���Ȃ� */
  alter2.k_nparts = 1; /* �L�[�p�[�g�̐�: 1 */
 /* �p�P��̈�Ɠ��{��̒P��̗̈�̌�� */
  alter2.k_part[0].kp_start = 0 + sizeof(rec_idx.english) +
                                  sizeof(rec_idx.japanese);
  alter2.k_part[0].kp_leng  = sizeof(rec_idx.lineno);

/* �����t�@�C���̑n�� */
  fname = "fcfa02.idx";
  flags = FA_IDXFILE | FA_OUTPUT | FA_VARLEN |
          FA_RNDACC | FA_EXCLLOCK | FA_NOTOPT;
  keylist = &klist;
  reclen = sizeof(rec_idx);
  fd_idx = cobfa_open(fname, flags, keylist, reclen);

/* �G���[���� */
  if (fd_idx == FAILED)
  {
    printf("�����t�@�C��: %s �̑n���Ɏ��s���܂����B\n", fname);
    cobfa_close(fd_lseq);
    exit (1);
  }

/* ���R�[�h��ǂݍ��݁A'lseq'�̊e�̈��'idx'�̗̈�ɓ]�L���ď������� */
  while (TRUE)
  {
    flags = FA_NEXT | FA_NOLOCK;
    ret = cobfa_rdnext(fd_lseq, flags, (char *)(&rec_lseq));
    if (ret == FAILED) break; /* FA_EENDFILE�����o����Astat:10���Ԃ����͂��B*/

    memset((char *)(&rec_idx), ' ', sizeof(rec_idx));
    memcpy(rec_idx.lineno,   rec_lseq.lineno,   sizeof(rec_idx.lineno));
    memcpy(rec_idx.english,  rec_lseq.english,  sizeof(rec_idx.english));
    memcpy(rec_idx.japanese, rec_lseq.japanese, sizeof(rec_idx.japanese));
    ret = cobfa_wrkey(fd_idx, (char *)(&rec_idx), sizeof(rec_idx));
  }

/* �t�@�C������� */
  cobfa_close(fd_lseq); /* �s���t�@�C��:'lseq'����� */
  cobfa_close(fd_idx);  /* �����t�@�C��:'idx'����� */


/* �����t�@�C�����ĂуI�[�v������ */
  flags = FA_IDXFILE | FA_INPUT | FA_VARLEN |
          FA_SEQACC | FA_AUTOLOCK | FA_NOTOPT;
  reclen = sizeof(rec_idx);
  fd_idx = cobfa_open(fname, flags, keylist, reclen);

/* �G���[���� */
  if (fd_idx == FAILED)
  {
    printf("�����t�@�C��: %s ���I�[�v���ł��܂���ł����B\n", fname);
    exit (1);
  }

/* ��L�[�ňȂĐ擪�̃��R�[�h�Ɉʒu���߂��� */
  flags = FA_FIRST;
  keynum = 0; /* �L�[�ԍ��͎g�p���Ȃ� */
  effkeylen = 0; /* ��L�[�̑S�� */
  ret = cobfa_stkey(fd_idx, flags, (char *)NULL, &prime, keynum, effkeylen);

/* ���R�[�h��ǂݍ��݁A�\������ */
  while (TRUE)
  {
    int fldlen;

    flags = FA_NEXT;
    ret = cobfa_rdnext(fd_idx, flags, (char *)(&rec_idx));
    if (ret == FAILED) break; /* FA_EENDFILE�����o����Astat:10���Ԃ����͂��B*/

    ldchar(rec_idx.lineno, sizeof(rec_idx.lineno), buff);
    printf("���̍s�ԍ�:%s, ", buff);

    ldchar(rec_idx.english, sizeof(rec_idx.english), buff);
    printf("�p��: %s,\t", buff);

    ldchar(rec_idx.japanese, sizeof(rec_idx.japanese), buff);
    printf("���{��: %s.\n", buff);
  }

/* �t�@�C������� */
  cobfa_close(fd_idx);

  exit (0);
}