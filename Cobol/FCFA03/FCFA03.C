/* COBOL�t�@�C���A�N�Z�X���[�`�� Copyright 1998-2015 FUJITSU LIMITED */
/* ���v���O���� fcfa03.c - �����t�@�C���̏��̎擾 */

#include <stdio.h>
#include "f3bifcfa.h"

/* �֐��̎��s���s����p�萔 */
#define FAILED -1

/* �����t�@�C�����̎擾�̂��߂̋@�\�R�[�h */
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

/* �L�[�\�����s���Ȋ����̍����t�@�C������̓I�[�v������ */
  fname = argv[1]; /* �R�}���h���C���̑����� */
 /* ���R�[�h�`���̓I�[�v�����ɔF������� */
  flags = FA_IDXFILE | FA_INPUT | FA_AUTOLOCK;
 /* �����t�@�C���̃I�[�v���ŁAkeylist�\���̃|�C���^�� */
 /* NULL�̏ꍇ�A�L�[�\���̓I�[�v�����ɔF�������      */
  keylist = (struct fa_keylist *)NULL;
 /* ���R�[�h���́A�I�[�v�����ɔF������� */
  reclen = 0;
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
    if (eno == FA_EBADFILE)
    {
      printf("�t�@�C��: %s �͍����t�@�C���łȂ����A"
             "�j�󂳂�Ă�������t�@�C���ł��Bstat:%02d\n", fname, stat);
    }
    else
    {
      printf("�t�@�C��: %s ���I�[�v���ł��܂���ł����Berrno: %d, stat: %02d\n",
             fname, eno, stat);
    }
    exit (1);
  }

/* �����t�@�C���̏���\�� */
  printf("�����t�@�C�����\n");
  printf(" �t�@�C����: %s\n", fname);

  keynum = DICTINFO;
  ret = cobfa_indexinfo(fd, (struct fa_keydesc *)(&dictinfo), keynum);

  printf("  fa_dictinfo.di_flags   (���R�[�h�`��:�Œ�/��)  : %s\n",
         (dictinfo.di_flags & FA_FIXLEN) ? "FA_FIXLEN" : "FA_VARLEN");

  printf("  fa_dictinfo.di_recsize (�Œ�/�ő僌�R�[�h��)     : %d\n",
         dictinfo.di_recsize);

  printf("  fa_dictinfo.di_idxsize (���R�[�h�L�[�̑���)      : %d\n",
         dictinfo.di_idxsize);

  nkeys = dictinfo.di_nkeys;
  printf("  fa_dictinfo.di_nkeys   (�L�[����`����Ă��鐔)  : %d\n",
         nkeys);

/* �e�L�[�̕\�� */
  for (keynum = PRIME; keynum <= nkeys; keynum ++)
  {
    printf("  keynum %3d: (fa_keylist.kl_key[%3d] ... %s���R�[�h�L�[)\n",
           keynum, keynum - 1, keynum == PRIME ? "��" : "��");

    ret = cobfa_indexinfo(fd, &keydesc, keynum);

    printf("   fa_keydesc.k_flags    (�d���\���ۂ�)             : %s\n",
           (keydesc.k_flags & FA_DUPS) ? "FA_DUPS" : "FA_NODUPS");

    nparts = keydesc.k_nparts;
    printf("   fa_keydesc.k_nparts   (�L�[�p�[�g�̐�)             : %d\n",
           nparts);

  /* �e�L�[�p�[�g�̕\�� */
    for (partnum = 0; partnum < nparts; partnum ++)
    {
      printf("    fa_keydesc.k_part[%3d].kp_start (�擪����̕ψ�): %d\n",
             partnum, keydesc.k_part[partnum].kp_start);

      printf("    fa_keydesc.k_part[%3d].kp_leng  (�L�[�p�[�g��)  : %d\n",
             partnum, keydesc.k_part[partnum].kp_leng);
    }
  }

/* �t�@�C������� */
  cobfa_close(fd);

  exit (0);
}