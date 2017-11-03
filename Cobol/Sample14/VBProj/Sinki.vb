Option Strict Off
Option Explicit On
Friend Class SINKI
	Inherits System.Windows.Forms.Form
	
	
	Private Sub ansyo_b_KeyPress(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.KeyPressEventArgs) Handles ansyo_b.KeyPress
		Dim keyascii As Short = Asc(eventArgs.KeyChar)
		If keyascii < Asc("0") Or keyascii > Asc("9") Then
			keyascii = 0
			Beep()
		End If
		eventArgs.KeyChar = Chr(keyascii)
		If keyascii = 0 Then
			eventArgs.Handled = True
		End If
	End Sub
	
	
	'ＯＫボタン
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		Dim namae As Object
		
		Static kouza_s As New VB6.FixedLengthString(5)
		
		'氏名が入力されたかチェック
		If na_mae.Text = "" Then
			err_code = 5
			ERROR_H.ShowDialog()
			Exit Sub
		Else
			'UPGRADE_WARNING: オブジェクト namae の既定プロパティを解決できませんでした。 詳細については、'ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"' をクリックしてください。
			namae = na_mae.Text
		End If
		
		'新規貯金額が入力されたかチェック
		If tyokin_g.Text = "" Then
			err_code = 6
			ERROR_H.ShowDialog()
			Exit Sub
		Else
			tyo_kin = Val(tyokin_g.Text)
		End If
		
		'暗証番号が入力されたかチェック
		If ansyo_b.Text = "" Then
			err_code = 2
			ERROR_H.ShowDialog()
			Exit Sub
		Else
			ansyo = Val(ansyo_b.Text)
		End If
		
		'UPGRADE_WARNING: オブジェクト namae の既定プロパティを解決できませんでした。 詳細については、'ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"' をクリックしてください。
		Call K_SIN(namae, tyo_kin, ansyo, kouza_s.Value, err_code)
		'エラー番号をチェック
		If err_code > 0 Then
			ERROR_H.ShowDialog()
			Exit Sub
		End If
		
		kouza_t = kouza_s.Value
		'UPGRADE_WARNING: オブジェクト namae の既定プロパティを解決できませんでした。 詳細については、'ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"' をクリックしてください。
		namae_t = namae
		
		'新規口座確認画面を開く
		SINKICHK.Show()
		Me.Close()
		
	End Sub
	
	
	'キャンセルボタン
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		
		sample14.Show()
		Me.Close()
		
	End Sub
	
	
	
	Private Sub tyokin_g_KeyPress(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.KeyPressEventArgs) Handles tyokin_g.KeyPress
		Dim keyascii As Short = Asc(eventArgs.KeyChar)
		If keyascii < Asc("0") Or keyascii > Asc("9") Then
			keyascii = 0
			Beep()
		End If
		eventArgs.KeyChar = Chr(keyascii)
		If keyascii = 0 Then
			eventArgs.Handled = True
		End If
	End Sub
End Class