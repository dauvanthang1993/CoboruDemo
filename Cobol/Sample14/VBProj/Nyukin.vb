Option Strict Off
Option Explicit On
Friend Class NYUKIN
	Inherits System.Windows.Forms.Form
	
	'�n�j�{�^��
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		
		'�����z�����͂���Ă��邩�`�F�b�N
		If nyukin_g.Text = "" Then
			err_code = 4
			ERROR_H.ShowDialog()
			Exit Sub
		Else
			nyu_kin = Val(nyukin_g.Text)
			kouza = Val(kouza_t)
		End If
		
		Call K_NYU(kouza, nyu_kin, tyo_kin, err_code)
		'�G���[�ԍ��̃`�F�b�N
		If err_code > 0 Then
			'�װ��ʂ��J��
			ERROR_H.ShowDialog()
		End If
		
		SELE.Show()
		Me.Close()
		
	End Sub
	
	'�L�����Z���{�^��
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		
		'�����ԍ��Ïؔԍ��\�������o���I����ʂ��J��
		SELE.Show()
		Me.Close()
		
	End Sub
	
	
	Private Sub NYUKIN_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		
		kouza_b.Text = kouza_t
		tyokin_g.Text = CStr(tyo_kin)
		na_mae.Text = namae_t
		
	End Sub
	
	
	Private Sub Text2_Change()
		
	End Sub
	
	
	Private Sub Text3_Change()
		
	End Sub
	
	
	Private Sub nyukin_g_KeyPress(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.KeyPressEventArgs) Handles nyukin_g.KeyPress
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