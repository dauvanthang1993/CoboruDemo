<HTML>
<HEAD>
    <TITLE>���j���[</TITLE>
    <LINK REL=stylesheet TYPE="text/css" HREF="style.css">
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#FFFFFF">
<%
'�J�E���^���X�V����B
Application.Lock
Application("Number") = Application("Number") + 1
Application.Unlock
%>
<P>���Ȃ���1999/12/24���琔����<FONT CLASS=BU><B><% = Application("Number") %>�Ԗ�</B></FONT>�̂��q�l�ł��B</P>
<HR>
<FORM METHOD ="post" ACTION="Auth.asp">
    <INPUT NAME="MENU" TYPE="radio" VALUE="�J�^���O" CHECKED>�J�^���O�V���b�s���O<BR>
    <INPUT NAME="MENU" TYPE="radio" VALUE="����o�^">����o�^<BR>
    <P>
    <INPUT TYPE="submit" VALUE=" �@�n�j�@ ">
    <INPUT TYPE="reset"  VALUE="�L�����Z��"><BR>
    </P>
<HR>
</FORM>
</BODY>
</HTML>