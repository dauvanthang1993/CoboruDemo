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
	
	
	'�n�j�{�^��
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		Dim namae As Object
		
		Static kouza_s As New VB6.FixedLengthString(5)
		
		'���������͂��ꂽ���`�F�b�N
		If na_mae.Text = "" Then
			err_code = 5
			ERROR_H.ShowDialog()
			Exit Sub
		Else
			'UPGRADE_WARNING: �I�u�W�F�N�g namae �̊���v���p�e�B�������ł��܂���ł����B �ڍׂɂ��ẮA'ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"' ���N���b�N���Ă��������B
			namae = na_mae.Text
		End If
		
		'�V�K�����z�����͂��ꂽ���`�F�b�N
		If tyokin_g.Text = "" Then
			err_code = 6
			ERROR_H.ShowDialog()
			Exit Sub
		Else
			tyo_kin = Val(tyokin_g.Text)
		End If
		
		'�Ïؔԍ������͂��ꂽ���`�F�b�N
		If ansyo_b.Text = "" Then
			err_code = 2
			ERROR_H.ShowDialog()
			Exit Sub
		Else
			ansyo = Val(ansyo_b.Text)
		End If
		
		'UPGRADE_WARNING: �I�u�W�F�N�g namae �̊���v���p�e�B�������ł��܂���ł����B �ڍׂɂ��ẮA'ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"' ���N���b�N���Ă��������B
		Call K_SIN(namae, tyo_kin, ansyo, kouza_s.Value, err_code)
		'�G���[�ԍ����`�F�b�N
		If err_code > 0 Then
			ERROR_H.ShowDialog()
			Exit Sub
		End If
		
		kouza_t = kouza_s.Value
		'UPGRADE_WARNING: �I�u�W�F�N�g namae �̊���v���p�e�B�������ł��܂���ł����B �ڍׂɂ��ẮA'ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"' ���N���b�N���Ă��������B
		namae_t = namae
		
		'�V�K�����m�F��ʂ��J��
		SINKICHK.Show()
		Me.Close()
		
	End Sub
	
	
	'�L�����Z���{�^��
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