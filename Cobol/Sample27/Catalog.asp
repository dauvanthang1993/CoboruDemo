<HTML>
<HEAD>
    <TITLE>�J�^���O</TITLE>
    <LINK REL=stylesheet TYPE="text/css" HREF="style.css">
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#FFFFFF">
<%
'���[�U�h�c�ƃp�X���[�h�����o���D
U_ID     = Request.Form("U_ID")
Password = Request.Form("Password")

'���̓G���[�łȂ��Ƃ��C�F�؏������Ăяo���D
If Not (U_ID = "" Or Password = "") Then
    Set OLSService = Server.CreateObject("STORESV1.ONLINE_STORE")
    rc = OLSService.ISUSER(U_ID,Password)
    '���A�l��100�̏ꍇ�A�F�؎��s�̃G���[���b�Z�[�W���o�͂���
    If rc = 100 Then
%>
        �F��<FONT COLOR=Red>���s</FONT>���܂����D<BR>
        <FONT COLOR=Blue>���[�U�h�c</FONT>�܂���<FONT COLOR=Blue>�p�X���[�h</FONT>���ԈႦ�Ă��܂��D<BR>
        <P>
        <FORM>
             <INPUT TYPE="button"  VALUE="�߂�"  onClick="location.href='Menu.asp'"><BR>
        </FORM>
        </P>
<%
    Else
%>
<A NAME="TAB"></A>
<%
        Session("UserID") = U_ID
        '�J�^���O�ꗗ��\������D
        Call Catalog_sub()
    End If
    Set OLSService = Nothing
'���̓G���[�̂Ƃ��C�G���[����������D
Else
        If U_ID = "" Then
            Response.Write("���[�U�h�c���w�肳��Ă��܂���D")
            Response.Write("<BR>")
        End If
        '�p�X���[�h���w�肳�ꂽ���`�F�b�N����
        If Password = "" Then
            Response.Write("�p�X���[�h���w�肳��Ă��܂���D")
            Response.Write("<BR>")
        End If
%>
        <FORM id=form1 name=form1>
                <INPUT TYPE="button"  VALUE="�߂�"  onClick="location.href='Auth.asp'"><BR>
        </FORM>
<%
End If
%>
<%
'�J�^���O�ꗗ�̕\������
Sub Catalog_sub()
%>
<H1><FONT COLOR=Blue>�J�^���O���</FONT></H1><BR>
<IMG SRC="CatalogTitle.gif" ALT=�^�C�g��">
<IMG SRC="fjlogo.gif" ALT="���S">
<HR>
���ʂ���͂��Ă��������D<BR>
<FORM METHOD ="post" ACTION="Confirm.asp">
    <TABLE BORDER="1" CELLSPACING="1">
        <TR ALIGN="center">
            <TH>���i��</TH>
            <TH>�X�y�b�N</TH>
            <TH>���f��</TH>
            <TH>�P��</TH>
            <TH>����</TH>
        </TR>
        <!-- ���f���P�e�[�u�� -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6450TX2</TD>
            <TD ROWSPAN=3>Pentium-II 450MHz,64MB,4.3GB,Viper V550,100BASE-TX</TD>
            <TD NOWRAP>WindowsNT���f��</TD>
            <TD>428000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model00_Amount" VALUE=0></TD></TR>
        <TR>
             <TD NOWRAP>Windows98���f��</TD>
             <TD>408000</TD>
             <TD><INPUT TYPE="text" SIZE="8" NAME="Model01_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95���f��</TD>
            <TD>408000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model02_Amount" VALUE=0></TD>
        </TR>
        <!-- ���f���Q�e�[�u�� -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6400TX2</TD>
            <TD ROWSPAN=3>Pentium-II 400MHz,64MB,4.3GB,Viper V550,100BASE-TX</TD>
            <TD NOWRAP>WindowsNT���f��</TD>
            <TD>368000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model03_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows98���f��</TD>
            <TD>348000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model04_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95���f��</TD>
            <TD>348000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model05_Amount" VALUE=0></TD>
        </TR>
        <!-- ���f���R�e�[�u�� -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6450DX2</TD>
            <TD ROWSPAN=3>Pentium-II 450MHz,32MB,4.3GB,RAGE PRO TURBO,�T�E���h,100BASE-TX</TD>
            <TD NOWRAP>WindowsNT���f��</TD>
            <TD>398000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model06_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows98���f��</TD>
            <TD>378000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model07_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95���f��</TD>
            <TD>378000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model08_Amount" VALUE=0></TD>
        </TR>
        <!-- ���f���S�e�[�u�� -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6400DX2</TD>
            <TD ROWSPAN=3>Pentium-II 400MHz,32MB,4.3GB,RAGE PRO TURBO,�T�E���h,100BASE-TX</TD>
            <TD NOWRAP>WindowsNT���f��</TD>
            <TD>338000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model09_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows98���f��</TD>
            <TD>318000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model10_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95���f��</TD>
            <TD>318000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model11_Amount" VALUE=0></TD>
        </TR>
        <!-- ���f���T�e�[�u�� -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6350DX2</TD>
            <TD ROWSPAN=3>Pentium-II 350MHz,32MB,4.3GB,RAGE PRO TURBO,�T�E���h,100BASE-TX</TD>
            <TD NOWRAP>WindowsNT���f��</TD>
            <TD>278000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model12_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows98���f��</TD>
            <TD>258000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model13_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95���f��</TD>
            <TD>258000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model14_Amount" VALUE=0></TD>
        </TR>
        <!-- ���f���U�e�[�u�� -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6366DX2c</TD>
            <TD ROWSPAN=3>Celeron 366MHz,32MB,4.3GB,RAGE PRO TURBO,�T�E���h,100BASE-TX</TD>
            <TD NOWRAP>WindowsNT���f��</TD>
            <TD>238000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model15_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows98���f��</TD>
            <TD>218000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model16_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95���f��</TD>
            <TD>218000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model17_Amount" VALUE=0></TD>
        </TR>
        </TABLE>
        <P>
        <INPUT TYPE="submit" VALUE="�I�[�_�[">
        <INPUT TYPE="reset"  VALUE=" �N���A ">
        <INPUT TYPE="button" VALUE="���j���[" onClick="location.href='MENU.asp'">
        </P>
</FORM>
<%
End Sub
%>
<HR>
</BODY>
</HTML>
