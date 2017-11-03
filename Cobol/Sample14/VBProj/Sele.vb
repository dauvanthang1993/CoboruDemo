Option Strict Off
Option Explicit On
Friend Class SELE
	Inherits System.Windows.Forms.Form
	
	
	'出勤ボタン
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		
		'出金画面を開く
		SYUKIN.Show()
		Me.Close()
		
	End Sub
	
	
	'入金ボタン
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		
		'入金画面を開く
		NYUKIN.Show()
		Me.Close()
		
	End Sub
	
	
	'キャンセルボタン
	Private Sub Command3_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command3.Click
		
		'口座番号暗証番号入力画面に戻る
		sample14.Show()
		Me.Close()
		
	End Sub
	
	
	Private Sub SELE_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		
		kouza_b.Text = kouza_t
		tyokin_g.Text = CStr(tyo_kin)
		na_mae.Text = namae_t
		
	End Sub
	
	
	Private Sub Text1_Change()
		
	End Sub
	
	
	Private Sub Text2_Change()
		
	End Sub
	
	
	Private Sub Timer1_Timer()
		
	End Sub
End Class