Option Strict Off
Option Explicit On
Friend Class SINKICHK
	Inherits System.Windows.Forms.Form
	'�n�j�{�^��
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		
		'�����ԍ��Ïؔԍ����͉�ʂɖ߂�
		sample14.Show()
		Me.Close()
		
	End Sub
	
	
	Private Sub Text1_Change()
		
	End Sub
	
	
	Private Sub SINKICHK_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		na_mae.Text = namae_t
		kouza_b.Text = kouza_t
		sample14.kouza_b.Text = ""
		sample14.ansyo_b.Text = ""
	End Sub
End Class