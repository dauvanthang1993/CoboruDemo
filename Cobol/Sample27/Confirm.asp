<HTML>
<HEAD>
    <TITLE>�I�[�_�[</TITLE>
    <LINK REL=stylesheet TYPE="text/css" HREF="style.css">
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#FFFFFF">
<%
'���f���P�`�U�̐��ʂ��󂯎��
Dim Model(100)
Dim Model_Amount(100)
Dim Model_Msg(100)

Model_Amount(0) = Request.Form("Model00_Amount")
Model_Amount(1) = Request.Form("Model01_Amount")
Model_Amount(2) = Request.Form("Model02_Amount")
Model_Amount(3) = Request.Form("Model03_Amount")
Model_Amount(4) = Request.Form("Model04_Amount")
Model_Amount(5) = Request.Form("Model05_Amount")
Model_Amount(6) = Request.Form("Model06_Amount")
Model_Amount(7) = Request.Form("Model07_Amount")
Model_Amount(8) = Request.Form("Model08_Amount")
Model_Amount(9) = Request.Form("Model09_Amount")
Model_Amount(10) = Request.Form("Model10_Amount")
Model_Amount(11) = Request.Form("Model11_Amount")
Model_Amount(12) = Request.Form("Model12_Amount")
Model_Amount(13) = Request.Form("Model13_Amount")
Model_Amount(14) = Request.Form("Model14_Amount")
Model_Amount(15) = Request.Form("Model15_Amount")
Model_Amount(16) = Request.Form("Model16_Amount")
Model_Amount(17) = Request.Form("Model17_Amount")


'�I�[�_�[�ԍ���ݒ肷��D
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

Dim r_order(100)
'�݌ɂ̃`�F�b�N������B
Set OLSService = Server.CreateObject("STORESV1.ONLINE_STORE")
For cnt = 0 To 17
    '�I�[�_�[�쐬��������̕ԋp�l�𒲂ׁA200�Ȃ�݌ɕs���̃G���[�Ƃ���
    If Not Model_Amount(cnt) = 0 Then
        rc = OLSService.StockCheck(r_num(cnt),Model_Amount(cnt))
        If rc = 200 Then
            Model_Msg(cnt) = "<FONT CLASS=RD>�݌ɕs��</FONT>�̈א��C���ʂ�<FONT CCLASS=RD>�[��</FONT>�ɂ��܂���"
            Model_Amount(cnt) = "0"
        Else
            Model_Msg(cnt) = "<FONT CLASS=BU>�݌ɂ���</FONT>"
        End If
        Session(r_num(cnt)) = Model_Amount(cnt)
    Else
        Model_Msg(cnt) = "�|�|"
    End If
Next
%>
<H1><FONT COLOR=Blue>�I�[�_�[�m�F���</FONT></H1><BR>
<P>
<FONT CLASS=BU>�I�[�_�[���m�F���āA��낵����΁m�I�[�_�[���s�n�{�^���������Ă�������</FONT>�B<BR>
�ēx���͂���ꍇ�́C�u���E�U�́y�߂�z���N���b�N���Ă��������B
</P>
<HR>
<FORM  METHOD ="post" ACTION="Order.asp">
    <TABLE BORDER="1" CELLSPACING="1">
    <TR ALIGN="center">
        <TH>���i��</TH>
        <TH>�X�y�b�N</TH>
        <TH>���f��</TH>
        <TH>�P��</TH>
        <TH>����</TH>
        <TH NOWRAP>���z</TH>
        <TH>���l</TH>
    </TR>
    <!-- ���f���P�e�[�u�� -->
    <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6450TX2</TH>
        <TD ROWSPAN=3>Pentium-II 450MHz,64MB,4.3GB,Viper V550,100BASE-TX</TD>
        <TD NOWRAP>WindowsNT���f��</TD>
        <TD>428000</TD>
        <TD><% = Model_Amount(0) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(428000 * Request.Form("Model00_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(0) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98���f��</TD>
        <TD>408000</TD>
        <TD><% = Model_Amount(1) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(408000 * Request.Form("Model01_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(1) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows95���f��</TD>
        <TD>408000</TD>
        <TD><% = Model_Amount(2) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(408000 * Request.Form("Model02_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(2) %></TD>
    </TR>
    <!-- ���f���Q�e�[�u�� -->
    <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6400TX2</TD>
        <TD ROWSPAN=3>Pentium-II 400MHz,64MB,4.3GB,Viper V550,100BASE-TX</TD>
        <TD NOWRAP>WindowsNT���f��</TD>
        <TD>368000</TD>
        <TD><% = Model_Amount(3) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(368000 * Request.Form("Model03_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(3) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98���f��</TD>
        <TD>348000</TD>
        <TD><% = Model_Amount(4) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(348000 * Request.Form("Model04_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(4) %></TD></TR>
    <TR>
        <TD NOWRAP>Windows95���f��</TD>
        <TD>348000</TD>
        <TD><% = Model_Amount(5) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(348000 * Request.Form("Model05_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(5) %></TD>
    </TR>
    <!-- ���f���R�e�[�u�� -->
    <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6450DX2</TD>
        <TD ROWSPAN=3>Pentium-II 450MHz,32MB,4.3GB,RAGE PRO TURBO,�T�E���h,100BASE-TX</TD>
        <TD NOWRAP>WindowsNT���f��</TD>
        <TD>398000</TD>
        <TD><% = Model_Amount(6) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(398000 * Request.Form("Model06_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(6) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98���f��</TD>
        <TD>378000</TD>
        <TD><% = Model_Amount(7) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(378000 * Request.Form("Model07_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(7) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows95���f��</TD>
        <TD>378000</TD>
        <TD><% = Model_Amount(8) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(378000 * Request.Form("Model08_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(8) %></TD>
    </TR>
    <!-- ���f���S�e�[�u�� -->
    <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6400DX2</TD>
        <TD ROWSPAN=3>Pentium-II 400MHz,32MB,4.3GB,RAGE PRO TURBO,�T�E���h,100BASE-TX</TD>
        <TD NOWRAP>WindowsNT���f��</TD>
        <TD>338000</TD>
        <TD><% = Model_Amount(9) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(338000 * Request.Form("Model09_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(9) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98���f��</TD>
        <TD>318000</TD>
        <TD><% = Model_Amount(10) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(318000 * Request.Form("Model10_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(10) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows95���f��</TD>
        <TD>318000</TD>
        <TD><% = Model_Amount(11) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(318000 * Request.Form("Model11_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(11) %></TD></TR>
    <!-- ���f���T�e�[�u�� -->
    <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6350DX2</TD>
        <TD ROWSPAN=3>Pentium-II 350MHz,32MB,4.3GB,RAGE PRO TURBO,�T�E���h,100BASE-TX</TD>
        <TD NOWRAP>WindowsNT���f��</TD>
        <TD>278000</TD>
        <TD><% = Model_Amount(12) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(278000 * Request.Form("Model12_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(12) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98���f��</TD>
        <TD>258000</TD>
        <TD><% = Model_Amount(13) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(258000 * Request.Form("Model13_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(13) %></TD></TR>
    <TR>
        <TD NOWRAP>Windows95���f��</TD>
        <TD>258000</TD>
        <TD><% = Model_Amount(14) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(258000 * Request.Form("Model14_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(14) %></TD>
    </TR>
    <!-- ���f���U�e�[�u�� -->
        <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6366DX2c</TD>
        <TD ROWSPAN=3>Celeron 366MHz,32MB,4.3GB,RAGE PRO TURBO,�T�E���h,100BASE-TX</TD>
        <TD NOWRAP>WindowsNT���f��</TD>
        <TD>238000</TD>
        <TD><% = Model_Amount(15) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(238000 * Request.Form("Model15_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(15) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98���f��</TD>
        <TD>218000</TD>
        <TD><% = Model_Amount(16) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(218000 * Request.Form("Model16_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(16) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows95���f��</TD>
        <TD>218000</TD>
        <TD><% = Model_Amount(17) %></TD>
        <!-- ���z -->
        <TD><% Response.Write(218000 * Request.Form("Model17_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(17) %></TD>
    </TR>
    </TABLE>
    <P>
    <INPUT TYPE="submit" VALUE="�I�[�_�[���s">
    <INPUT TYPE="button" VALUE="�@���j���[�@" onClick="location.href='Menu.asp'">
    </P>
</FORM>
<HR>
</BODY>
</HTML>
