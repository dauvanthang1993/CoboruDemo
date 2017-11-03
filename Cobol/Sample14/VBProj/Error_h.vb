Option Strict Off
Option Explicit On
Friend Class ERROR_H
	Inherits System.Windows.Forms.Form
	
	
	
	'ＯＫボタン
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		Me.Close()
	End Sub
	
	Private Sub ERROR_H_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		
		Select Case err_code
			Case 1
				err_m.Text = "口座番号が入力されていません。"
			Case 2
				err_m.Text = "暗証番号が入力されていません。"
			Case 3
				err_m.Text = "出金額が入力されていません。"
			Case 4
				err_m.Text = "入金額が入力されていません。"
			Case 5
				err_m.Text = "氏名が入力されていません。"
			Case 6
				err_m.Text = "新規貯金額が入力されてません。"
			Case 7
				err_m.Text = "口座番号が見つかりません。"
			Case 8
				err_m.Text = "暗証番号が違います。"
			Case 9
				err_m.Text = "貯金額がマイナスになります。"
			Case 10
				err_m.Text = "金額の制限をオーバーします。"
			Case 11
				err_m.Text = "口座はこれ以上作れません。"
		End Select
		
	End Sub
End Class