<HTML>
<HEAD>
        <TITLE>����F��</TITLE>
        <LINK REL=stylesheet TYPE="text/css" HREF="style.css">
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#FFFFFF">
<H1><FONT COLOR=Blue>����F��</FONT></H1><BR>
���Ȃ���ID�ƃp�X���[�h����͂��ĉ������B
<HR>
<%
menu = Request.Form("MENU")
If menu = "����o�^" Then
        Response.Write("���݁C<FONT CLASS=RD>����o�^</FONT>�́C�����p�ł��܂���B")
%>
        <BR>
        <FORM id=form1 name=form1>
                <INPUT TYPE="button"  VALUE="�߂�"  onClick="location.href='Menu.asp'" id=button1 name=button1><BR>
        </FORM>
        <HR>
<%
Else
%>
        <BR>
        <FORM METHOD ="post" ACTION="Catalog.asp">
            <TABLE BORDER=0 ALIGN=center>
                <TR>
                    <TD>���[�U�h�c�F</TD>
                    <TD><INPUT TYPE="TEXT" NAME="U_ID" SIZE="15"></TD>
                </TR>
                <TR>
                    <TD>�p�X���[�h�F</TD>
                    <TD><INPUT  TYPE="PASSWORD" NAME="Password" SIZE="15"></TD>
                </TABLE>
                <HR>
                <CENTER>
                <INPUT TYPE="submit" VALUE=" �@�n�j�@ ">
                <INPUT TYPE="button" VALUE="�L�����Z��" onClick="location.href='MENU.asp'"><BR>
                </CENTER>
                </P>
        </FORM>
<%
End If
%>
</BODY>
</HTML>