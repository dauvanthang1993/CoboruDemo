<HTML>
<HEAD>
    <TITLE>オーダー発行</TITLE>
    <LINK REL=stylesheet TYPE="text/css" HREF="style.css">
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#FFFFFF">
<%

'ユーザＩＤを受け取る。
id = Session("UserID")
'Request.Form("U_ID")

'モデル１～６の数量を受け取る。
Dim Model(100)
Dim Model_Amount(100)
Dim Model_Msg(100)

'オーダー番号を設定する。
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


'オーダー日は固定にする。分からない？
Order_Date = "999999999999"

%>
<H1><FONT COLOR=Blue>受注画面</FONT></H1><BR>
    <HR>
    <BLOCKQUOTE>
    <P>
    <FONT>以下のオーダーを受け付けました。またのご利用をお待ちしております。</FONT><BR>
    </P>
    <!-- オーダー番号一覧表を作成する(ヘッダー部) -->
<%
'在庫のチェックをする。
Set obj = Server.CreateObject("STORESV1.ONLINE_STORE")
HeadFlag = 0
For cnt = 0 To 17
    'オーダー作成処理からの返却値を調べ、200なら在庫不足のエラーとする
    Model_Amount(cnt) = Session(r_num(cnt))
    If Not Model_Amount(cnt) = "" Then
        ret = obj.ORDERREGIST(Order_Date,id,r_num(cnt),Model_Amount(cnt))
        If HeadFlag = 0 Then
%>
        <!-- 表のヘッダを出力する -->
        <TABLE BORDER="1" CELLSPACING="1">
        <TR>
            <TD>ユーザＩＤ</TD>
            <TD><% Response.Write(Session("UserID")) %></TD>
            <TD>オーダ番号</TD>
            <TD><% Response.Write(ret)%></TD>
        </TR>
        </TABLE BORDER="1">
        <BR>
        <TABLE BORDER="1" CELLSPACING="1">
        <TR ALIGN="center">
            <TH>製品番号</TH>
            <TH>数量</TH>
        </TR>
<%
        End If
        HeadFlag = 1

%>
        <!-- 登録した商品のオーダー番号，製品番号および数量を表にする -->
        <TR NOWRAP>
            <TD ALIGN="center" WIDTH="100"><% Response.Write(r_num(cnt)) %></TD>
            <TD ALIGN="center" WIDTH="50"><% Response.Write(Model_Amount(cnt)) %></TD>
        </TR>
<%
    End If
Next
%>
        <!-- 表を閉じる -->
        </TABLE>
        </BLOCKQUOTE>
<FORM>
    <INPUT TYPE="button" VALUE="メニュー" onClick="location.href='Menu.asp'">
    </P>
</FORM>
<HR>
<P>
<FONT CLASS=RD>【注意】</FONT></BR>
ブラウザの【更新】ボタンをクリックすると，二重登録になります。<BR>
</P>
</BODY>
</HTML>
