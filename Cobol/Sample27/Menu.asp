<HTML>
<HEAD>
    <TITLE>メニュー</TITLE>
    <LINK REL=stylesheet TYPE="text/css" HREF="style.css">
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#FFFFFF">
<%
'カウンタを更新する。
Application.Lock
Application("Number") = Application("Number") + 1
Application.Unlock
%>
<P>あなたは1999/12/24から数えて<FONT CLASS=BU><B><% = Application("Number") %>番目</B></FONT>のお客様です。</P>
<HR>
<FORM METHOD ="post" ACTION="Auth.asp">
    <INPUT NAME="MENU" TYPE="radio" VALUE="カタログ" CHECKED>カタログショッピング<BR>
    <INPUT NAME="MENU" TYPE="radio" VALUE="会員登録">会員登録<BR>
    <P>
    <INPUT TYPE="submit" VALUE=" 　ＯＫ　 ">
    <INPUT TYPE="reset"  VALUE="キャンセル"><BR>
    </P>
<HR>
</FORM>
</BODY>
</HTML>