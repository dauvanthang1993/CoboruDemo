<HTML>
<HEAD>
    <TITLE>�I�[�_�[���s</TITLE>
    <LINK REL=stylesheet TYPE="text/css" HREF="style.css">
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#FFFFFF">
<%

'���[�U�h�c���󂯎��B
id = Session("UserID")
'Request.Form("U_ID")

'���f���P�`�U�̐��ʂ��󂯎��B
Dim Model(100)
Dim Model_Amount(100)
Dim Model_Msg(100)

'�I�[�_�[�ԍ���ݒ肷��B
Dim r_num(100)

r_num(0) = "FMV2TXH111"
r_num(1) = "FMV2TXH161"
r_num(2) = "FMV2TXH151"
r_num(3) = "FMV2TXF111"
r_num(4) = "FMV2TXF161"
r_num(5) = "FMV2TXF151"
r_num(6) = "FMV2DXH111"
r_num(7) = "FMV2DXH161"
r_num(8) = "FMV2DXH151"
r_num(9) = "FMV2DXF111"
r_num(10) = "FMV2DXF161"
r_num(11) = "FMV2DXF151"
r_num(12) = "FMV2DXD111"
r_num(13) = "FMV2DXD161"
r_num(14) = "FMV2DXD151"
r_num(15) = "FMV2DXA111"
r_num(16) = "FMV2DXA161"
r_num(17) = "FMV2DXA151"


'�I�[�_�[���͌Œ�ɂ���B������Ȃ��H
Order_Date = "999999999999"

%>
<H1><FONT COLOR=Blue>�󒍉��</FONT></H1><BR>
    <HR>
    <BLOCKQUOTE>
    <P>
    <FONT>�ȉ��̃I�[�_�[���󂯕t���܂����B�܂��̂����p�����҂����Ă���܂��B</FONT><BR>
    </P>
    <!-- �I�[�_�[�ԍ��ꗗ�\���쐬����(�w�b�_�[��) -->
<%
'�݌ɂ̃`�F�b�N������B
Set obj = Server.CreateObject("STORESV1.ONLINE_STORE")
HeadFlag = 0
For cnt = 0 To 17
    '�I�[�_�[�쐬��������̕ԋp�l�𒲂ׁA200�Ȃ�݌ɕs���̃G���[�Ƃ���
    Model_Amount(cnt) = Session(r_num(cnt))
    If Not Model_Amount(cnt) = "" Then
        ret = obj.ORDERREGIST(Order_Date,id,r_num(cnt),Model_Amount(cnt))
        If HeadFlag = 0 Then
%>
        <!-- �\�̃w�b�_���o�͂��� -->
        <TABLE BORDER="1" CELLSPACING="1">
        <TR>
            <TD>���[�U�h�c</TD>
            <TD><% Response.Write(Session("UserID")) %></TD>
            <TD>�I�[�_�ԍ�</TD>
            <TD><% Response.Write(ret)%></TD>
        </TR>
        </TABLE BORDER="1">
        <BR>
        <TABLE BORDER="1" CELLSPACING="1">
        <TR ALIGN="center">
            <TH>���i�ԍ�</TH>
            <TH>����</TH>
        </TR>
<%
        End If
        HeadFlag = 1

%>
        <!-- �o�^�������i�̃I�[�_�[�ԍ��C���i�ԍ�����ѐ��ʂ�\�ɂ��� -->
        <TR NOWRAP>
            <TD ALIGN="center" WIDTH="100"><% Response.Write(r_num(cnt)) %></TD>
            <TD ALIGN="center" WIDTH="50"><% Response.Write(Model_Amount(cnt)) %></TD>
        </TR>
<%
    End If
Next
%>
        <!-- �\����� -->
        </TABLE>
        </BLOCKQUOTE>
<FORM>
    <INPUT TYPE="button" VALUE="���j���[" onClick="location.href='Menu.asp'">
    </P>
</FORM>
<HR>
<P>
<FONT CLASS=RD>�y���Ӂz</FONT></BR>
�u���E�U�́y�X�V�z�{�^�����N���b�N����ƁC��d�o�^�ɂȂ�܂��B<BR>
</P>
</BODY>
</HTML>
