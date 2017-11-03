<HTML>
<HEAD>
    <TITLE>カタログ</TITLE>
    <LINK REL=stylesheet TYPE="text/css" HREF="style.css">
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#FFFFFF">
<%
'ユーザＩＤとパスワードを取り出す．
U_ID     = Request.Form("U_ID")
Password = Request.Form("Password")

'入力エラーでないとき，認証処理を呼び出す．
If Not (U_ID = "" Or Password = "") Then
    Set OLSService = Server.CreateObject("STORESV1.ONLINE_STORE")
    rc = OLSService.ISUSER(U_ID,Password)
    '復帰値が100の場合、認証失敗のエラーメッセージを出力する
    If rc = 100 Then
%>
        認証<FONT COLOR=Red>失敗</FONT>しました．<BR>
        <FONT COLOR=Blue>ユーザＩＤ</FONT>または<FONT COLOR=Blue>パスワード</FONT>が間違えています．<BR>
        <P>
        <FORM>
             <INPUT TYPE="button"  VALUE="戻る"  onClick="location.href='Menu.asp'"><BR>
        </FORM>
        </P>
<%
    Else
%>
<A NAME="TAB"></A>
<%
        Session("UserID") = U_ID
        'カタログ一覧を表示する．
        Call Catalog_sub()
    End If
    Set OLSService = Nothing
'入力エラーのとき，エラー処理をする．
Else
        If U_ID = "" Then
            Response.Write("ユーザＩＤが指定されていません．")
            Response.Write("<BR>")
        End If
        'パスワードが指定されたかチェックする
        If Password = "" Then
            Response.Write("パスワードが指定されていません．")
            Response.Write("<BR>")
        End If
%>
        <FORM id=form1 name=form1>
                <INPUT TYPE="button"  VALUE="戻る"  onClick="location.href='Auth.asp'"><BR>
        </FORM>
<%
End If
%>
<%
'カタログ一覧の表示処理
Sub Catalog_sub()
%>
<H1><FONT COLOR=Blue>カタログ画面</FONT></H1><BR>
<IMG SRC="CatalogTitle.gif" ALT=タイトル">
<IMG SRC="fjlogo.gif" ALT="ロゴ">
<HR>
数量を入力してください．<BR>
<FORM METHOD ="post" ACTION="Confirm.asp">
    <TABLE BORDER="1" CELLSPACING="1">
        <TR ALIGN="center">
            <TH>製品名</TH>
            <TH>スペック</TH>
            <TH>モデル</TH>
            <TH>単価</TH>
            <TH>数量</TH>
        </TR>
        <!-- モデル１テーブル -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6450TX2</TD>
            <TD ROWSPAN=3>Pentium-II 450MHz,64MB,4.3GB,Viper V550,100BASE-TX</TD>
            <TD NOWRAP>WindowsNTモデル</TD>
            <TD>428000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model00_Amount" VALUE=0></TD></TR>
        <TR>
             <TD NOWRAP>Windows98モデル</TD>
             <TD>408000</TD>
             <TD><INPUT TYPE="text" SIZE="8" NAME="Model01_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95モデル</TD>
            <TD>408000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model02_Amount" VALUE=0></TD>
        </TR>
        <!-- モデル２テーブル -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6400TX2</TD>
            <TD ROWSPAN=3>Pentium-II 400MHz,64MB,4.3GB,Viper V550,100BASE-TX</TD>
            <TD NOWRAP>WindowsNTモデル</TD>
            <TD>368000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model03_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows98モデル</TD>
            <TD>348000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model04_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95モデル</TD>
            <TD>348000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model05_Amount" VALUE=0></TD>
        </TR>
        <!-- モデル３テーブル -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6450DX2</TD>
            <TD ROWSPAN=3>Pentium-II 450MHz,32MB,4.3GB,RAGE PRO TURBO,サウンド,100BASE-TX</TD>
            <TD NOWRAP>WindowsNTモデル</TD>
            <TD>398000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model06_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows98モデル</TD>
            <TD>378000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model07_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95モデル</TD>
            <TD>378000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model08_Amount" VALUE=0></TD>
        </TR>
        <!-- モデル４テーブル -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6400DX2</TD>
            <TD ROWSPAN=3>Pentium-II 400MHz,32MB,4.3GB,RAGE PRO TURBO,サウンド,100BASE-TX</TD>
            <TD NOWRAP>WindowsNTモデル</TD>
            <TD>338000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model09_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows98モデル</TD>
            <TD>318000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model10_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95モデル</TD>
            <TD>318000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model11_Amount" VALUE=0></TD>
        </TR>
        <!-- モデル５テーブル -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6350DX2</TD>
            <TD ROWSPAN=3>Pentium-II 350MHz,32MB,4.3GB,RAGE PRO TURBO,サウンド,100BASE-TX</TD>
            <TD NOWRAP>WindowsNTモデル</TD>
            <TD>278000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model12_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows98モデル</TD>
            <TD>258000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model13_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95モデル</TD>
            <TD>258000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model14_Amount" VALUE=0></TD>
        </TR>
        <!-- モデル６テーブル -->
        <TR>
            <TD NOWRAP ROWSPAN=3>FMV-6366DX2c</TD>
            <TD ROWSPAN=3>Celeron 366MHz,32MB,4.3GB,RAGE PRO TURBO,サウンド,100BASE-TX</TD>
            <TD NOWRAP>WindowsNTモデル</TD>
            <TD>238000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model15_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows98モデル</TD>
            <TD>218000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model16_Amount" VALUE=0></TD>
        </TR>
        <TR>
            <TD NOWRAP>Windows95モデル</TD>
            <TD>218000</TD>
            <TD><INPUT TYPE="text" SIZE="8" NAME="Model17_Amount" VALUE=0></TD>
        </TR>
        </TABLE>
        <P>
        <INPUT TYPE="submit" VALUE="オーダー">
        <INPUT TYPE="reset"  VALUE=" クリア ">
        <INPUT TYPE="button" VALUE="メニュー" onClick="location.href='MENU.asp'">
        </P>
</FORM>
<%
End Sub
%>
<HR>
</BODY>
</HTML>
