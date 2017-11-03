<HTML>
<HEAD>
    <TITLE>オーダー</TITLE>
    <LINK REL=stylesheet TYPE="text/css" HREF="style.css">
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#FFFFFF">
<%
'モデル１～６の数量を受け取る
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


'オーダー番号を設定する．
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
'在庫のチェックをする。
Set OLSService = Server.CreateObject("STORESV1.ONLINE_STORE")
For cnt = 0 To 17
    'オーダー作成処理からの返却値を調べ、200なら在庫不足のエラーとする
    If Not Model_Amount(cnt) = 0 Then
        rc = OLSService.StockCheck(r_num(cnt),Model_Amount(cnt))
        If rc = 200 Then
            Model_Msg(cnt) = "<FONT CLASS=RD>在庫不足</FONT>の為数，数量を<FONT CCLASS=RD>ゼロ</FONT>にしました"
            Model_Amount(cnt) = "0"
        Else
            Model_Msg(cnt) = "<FONT CLASS=BU>在庫あり</FONT>"
        End If
        Session(r_num(cnt)) = Model_Amount(cnt)
    Else
        Model_Msg(cnt) = "－－"
    End If
Next
%>
<H1><FONT COLOR=Blue>オーダー確認画面</FONT></H1><BR>
<P>
<FONT CLASS=BU>オーダーを確認して、よろしければ［オーダー発行］ボタンを押してください</FONT>。<BR>
再度入力する場合は，ブラウザの【戻る】をクリックしてください。
</P>
<HR>
<FORM  METHOD ="post" ACTION="Order.asp">
    <TABLE BORDER="1" CELLSPACING="1">
    <TR ALIGN="center">
        <TH>製品名</TH>
        <TH>スペック</TH>
        <TH>モデル</TH>
        <TH>単価</TH>
        <TH>数量</TH>
        <TH NOWRAP>金額</TH>
        <TH>備考</TH>
    </TR>
    <!-- モデル１テーブル -->
    <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6450TX2</TH>
        <TD ROWSPAN=3>Pentium-II 450MHz,64MB,4.3GB,Viper V550,100BASE-TX</TD>
        <TD NOWRAP>WindowsNTモデル</TD>
        <TD>428000</TD>
        <TD><% = Model_Amount(0) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(428000 * Request.Form("Model00_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(0) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98モデル</TD>
        <TD>408000</TD>
        <TD><% = Model_Amount(1) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(408000 * Request.Form("Model01_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(1) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows95モデル</TD>
        <TD>408000</TD>
        <TD><% = Model_Amount(2) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(408000 * Request.Form("Model02_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(2) %></TD>
    </TR>
    <!-- モデル２テーブル -->
    <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6400TX2</TD>
        <TD ROWSPAN=3>Pentium-II 400MHz,64MB,4.3GB,Viper V550,100BASE-TX</TD>
        <TD NOWRAP>WindowsNTモデル</TD>
        <TD>368000</TD>
        <TD><% = Model_Amount(3) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(368000 * Request.Form("Model03_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(3) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98モデル</TD>
        <TD>348000</TD>
        <TD><% = Model_Amount(4) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(348000 * Request.Form("Model04_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(4) %></TD></TR>
    <TR>
        <TD NOWRAP>Windows95モデル</TD>
        <TD>348000</TD>
        <TD><% = Model_Amount(5) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(348000 * Request.Form("Model05_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(5) %></TD>
    </TR>
    <!-- モデル３テーブル -->
    <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6450DX2</TD>
        <TD ROWSPAN=3>Pentium-II 450MHz,32MB,4.3GB,RAGE PRO TURBO,サウンド,100BASE-TX</TD>
        <TD NOWRAP>WindowsNTモデル</TD>
        <TD>398000</TD>
        <TD><% = Model_Amount(6) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(398000 * Request.Form("Model06_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(6) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98モデル</TD>
        <TD>378000</TD>
        <TD><% = Model_Amount(7) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(378000 * Request.Form("Model07_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(7) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows95モデル</TD>
        <TD>378000</TD>
        <TD><% = Model_Amount(8) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(378000 * Request.Form("Model08_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(8) %></TD>
    </TR>
    <!-- モデル４テーブル -->
    <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6400DX2</TD>
        <TD ROWSPAN=3>Pentium-II 400MHz,32MB,4.3GB,RAGE PRO TURBO,サウンド,100BASE-TX</TD>
        <TD NOWRAP>WindowsNTモデル</TD>
        <TD>338000</TD>
        <TD><% = Model_Amount(9) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(338000 * Request.Form("Model09_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(9) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98モデル</TD>
        <TD>318000</TD>
        <TD><% = Model_Amount(10) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(318000 * Request.Form("Model10_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(10) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows95モデル</TD>
        <TD>318000</TD>
        <TD><% = Model_Amount(11) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(318000 * Request.Form("Model11_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(11) %></TD></TR>
    <!-- モデル５テーブル -->
    <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6350DX2</TD>
        <TD ROWSPAN=3>Pentium-II 350MHz,32MB,4.3GB,RAGE PRO TURBO,サウンド,100BASE-TX</TD>
        <TD NOWRAP>WindowsNTモデル</TD>
        <TD>278000</TD>
        <TD><% = Model_Amount(12) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(278000 * Request.Form("Model12_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(12) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98モデル</TD>
        <TD>258000</TD>
        <TD><% = Model_Amount(13) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(258000 * Request.Form("Model13_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(13) %></TD></TR>
    <TR>
        <TD NOWRAP>Windows95モデル</TD>
        <TD>258000</TD>
        <TD><% = Model_Amount(14) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(258000 * Request.Form("Model14_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(14) %></TD>
    </TR>
    <!-- モデル６テーブル -->
        <TR>
        <TD NOWRAP ROWSPAN=3>FMV-6366DX2c</TD>
        <TD ROWSPAN=3>Celeron 366MHz,32MB,4.3GB,RAGE PRO TURBO,サウンド,100BASE-TX</TD>
        <TD NOWRAP>WindowsNTモデル</TD>
        <TD>238000</TD>
        <TD><% = Model_Amount(15) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(238000 * Request.Form("Model15_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(15) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows98モデル</TD>
        <TD>218000</TD>
        <TD><% = Model_Amount(16) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(218000 * Request.Form("Model16_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(16) %></TD>
    </TR>
    <TR>
        <TD NOWRAP>Windows95モデル</TD>
        <TD>218000</TD>
        <TD><% = Model_Amount(17) %></TD>
        <!-- 金額 -->
        <TD><% Response.Write(218000 * Request.Form("Model17_Amount")) %></TD>
        <TD NOWRAP><% = Model_Msg(17) %></TD>
    </TR>
    </TABLE>
    <P>
    <INPUT TYPE="submit" VALUE="オーダー発行">
    <INPUT TYPE="button" VALUE="　メニュー　" onClick="location.href='Menu.asp'">
    </P>
</FORM>
<HR>
</BODY>
</HTML>
