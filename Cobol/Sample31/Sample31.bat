@echo off
    set msg=MessageBox関数の戻り値に従って，値を返します。
:START
    echo %msg%
    set msg=『キャンセル』が押されたので，はじめからやりなおします。
    start /w MsgBox.exe
    @rem 復帰値が9999以上ならCOBOLプログラムを再度呼び出す
    if errorlevel 9999 goto START
    @rem 復帰値が9以上なら『いいえ』が押された。
    if errorlevel 9 goto NG
    echo 『はい』が押されました。
    goto END
:NG
    echo 『いいえ』が押されました。
:END
set msg=
