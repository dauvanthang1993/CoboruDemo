@echo off
    set msg=MessageBox�֐��̖߂�l�ɏ]���āC�l��Ԃ��܂��B
:START
    echo %msg%
    set msg=�w�L�����Z���x�������ꂽ�̂ŁC�͂��߂�����Ȃ����܂��B
    start /w MsgBox.exe
    @rem ���A�l��9999�ȏ�Ȃ�COBOL�v���O�������ēx�Ăяo��
    if errorlevel 9999 goto START
    @rem ���A�l��9�ȏ�Ȃ�w�������x�������ꂽ�B
    if errorlevel 9 goto NG
    echo �w�͂��x��������܂����B
    goto END
:NG
    echo �w�������x��������܂����B
:END
set msg=
