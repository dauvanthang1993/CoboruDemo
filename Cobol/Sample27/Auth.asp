<HTML>
<HEAD>
        <TITLE>会員認証</TITLE>
        <LINK REL=stylesheet TYPE="text/css" HREF="style.css">
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#FFFFFF">
<H1><FONT COLOR=Blue>会員認証</FONT></H1><BR>
あなたのIDとパスワードを入力して下さい。
<HR>
<%
menu = Request.Form("MENU")
If menu = "会員登録" Then
        Response.Write("現在，<FONT CLASS=RD>会員登録</FONT>は，ご利用できません。")
%>
        <BR>
        <FORM id=form1 name=form1>
                <INPUT TYPE="button"  VALUE="戻る"  onClick="location.href='Menu.asp'" id=button1 name=button1><BR>
        </FORM>
        <HR>
<%
Else
%>
        <BR>
        <FORM METHOD ="post" ACTION="Catalog.asp">
            <TABLE BORDER=0 ALIGN=center>
                <TR>
                    <TD>ユーザＩＤ：</TD>
                    <TD><INPUT TYPE="TEXT" NAME="U_ID" SIZE="15"></TD>
                </TR>
                <TR>
                    <TD>パスワード：</TD>
                    <TD><INPUT  TYPE="PASSWORD" NAME="Password" SIZE="15"></TD>
                </TABLE>
                <HR>
                <CENTER>
                <INPUT TYPE="submit" VALUE=" 　ＯＫ　 ">
                <INPUT TYPE="button" VALUE="キャンセル" onClick="location.href='MENU.asp'"><BR>
                </CENTER>
                </P>
        </FORM>
<%
End If
%>
</BODY>
</HTML>