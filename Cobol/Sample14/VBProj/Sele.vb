Option Strict Off
Option Explicit On
Friend Class SELE
	Inherits System.Windows.Forms.Form
	
	
	'�o�΃{�^��
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		
		'�o����ʂ��J��
		SYUKIN.Show()
		Me.Close()
		
	End Sub
	
	
	'�����{�^��
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		
		'������ʂ��J��
		NYUKIN.Show()
		Me.Close()
		
	End Sub
	
	
	'�L�����Z���{�^��
	Private Sub Command3_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command3.Click
		
		'�����ԍ��Ïؔԍ����͉�ʂɖ߂�
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