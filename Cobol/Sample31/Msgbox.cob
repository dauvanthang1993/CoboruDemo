000100 @OPTIONS ALPHAL(WORD)
000200*=================================================================
000300*�u���b�Z�[�W�{�b�N�X�̏o�́v
000400*
000500*  ����: �����N����"USER32.LIB"���w�肵�Ă��������B
000600*
000700*     Copyright 2000-2015 FUJITSU LIMITED
000800*=================================================================
000900 PROGRAM-ID. MsgBox.
001000 ENVIRONMENT DIVISION.
001100 CONFIGURATION SECTION.
001200 SPECIAL-NAMES.
001300     SYMBOLIC CONSTANT
001400       IDYES   IS 6
001500       IDNO    IS 7.
001600 DATA DIVISION.
001700 WORKING-STORAGE SECTION.
001800 01 MsgTITLE   PIC X(30).
001900 01 MsgBody    PIC X(80).
002000 01 RETCODE    PIC S9(9) COMP-5 VALUE 0.
002100 PROCEDURE DIVISION.
002200*-----------------------------------------------------------------
002300*  ������̖����ɂ� LOW-VALUE �����܂��B
002400*-----------------------------------------------------------------
002500     MOVE  "From COBOL: �^�C�g��"      TO  MsgTITLE
002600     MOVE  LOW-VALUE                   TO  MsgTITLE(21:1)
002700     MOVE  "���b�Z�[�W�{�b�N�X�ł��B"  TO  MsgBody
002800     MOVE  LOW-VALUE                   TO  MsgBody(25:1)
002900*-----------------------------------------------------------------
003000*  ���b�Z�[�W�{�b�N�X�̊֐����́uMessageBoxA�v(�����ɁuA�v���t��
003100*  ���Ƃɒ���)�B
003200*  �܂��A��������L���ɂ��邽�߁A"NOALPHAL" �܂��� "ALPHAL(WORD)"
003300*  �I�v�V�������w�肵�܂��B
003400*-----------------------------------------------------------------
003500     CALL "MessageBoxA"        *> ���b�Z�[�W�{�b�N�X�V�X�e���֐�
003600       WITH STDCALL            *> STDCALL�ďo���ɂ���
003700       USING
003800         BY VALUE     0        *> �n���h�� ("0"�ɂ���)
003900         BY REFERENCE MsgBody  *> ���b�Z�[�W�{��
004000         BY REFERENCE MsgTITLE *> ���b�Z�[�W�{�b�N�X�^�C�g��
004100         BY VALUE     3        *> ���b�Z�[�W�{�b�N�X�̃^�C�v (0�`5)
004200      RETURNING     RETCODE    *> ���A�l
004300*-----------------------------------------------------------------
004400*  ���b�Z�[�W�{�b�N�X�́u�{�^���v�ɂ���ĕ��A�l���ς��܂��B
004500*  �u�͂��v�������ƂO���C�u�������v�������ƂX�C�u�L�����Z���v��
004600*  �����ƂX�X�X�X��Ԃ��܂��B
004700*-----------------------------------------------------------------
004800     EVALUATE RETCODE
004900     WHEN IDYES
005000       move 0 TO RETURN-CODE
005100     WHEN IDNO
005200       move 9 TO RETURN-CODE
005300     WHEN OTHER
005400       move 9999 TO RETURN-CODE
005500     END-EVALUATE
005600     EXIT PROGRAM
005700 END PROGRAM MsgBox.
