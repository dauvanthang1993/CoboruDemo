Option Strict Off
Option Explicit On
Friend Class sample14
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
	
	
	'�V�K�����{�^��
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		'�V�K������ʂ��J��
		SINKI.Show()
		'�t�H�[�����\��
		Hide()
	End Sub
	
	'�n�j�{�^��
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		
		Static namae As New VB6.FixedLengthString(12)
		
		' �����ԍ������͂���Ă��邩�`�F�b�N
		If kouza_b.Text = "" Then
			err_code = 1
			ERROR_H.ShowDialog()
			Exit Sub
		Else
			kouza_t = kouza_b.Text
			kouza = Val(kouza_b.Text)
		End If
		
		' �Ïؔԍ������͂���Ă��邩�`�F�b�N
		If ansyo_b.Text = "" Then
			err_code = 2
			ERROR_H.ShowDialog()
			Exit Sub
		Else
			ansyo = Val(ansyo_b.Text)
		End If
		
		Call K_KEN(kouza, ansyo, namae.Value, tyo_kin, err_code)
		'�G���[�ԍ����`�F�b�N
		If err_code > 0 Then
			ERROR_H.ShowDialog()
			Exit Sub
		End If
		
		namae_t = namae.Value
		'�����ԍ��A�Ïؔԍ��̕\�����N���A
		kouza_b.Text = ""
		ansyo_b.Text = ""
		'�����z�\���A�����o���I����ʂ��J��
		SELE.Show()
		'�t�H�[�����\��
		Hide()
	End Sub
	
	
	'�I���{�^��
	Private Sub Command3_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command3.Click
		Me.Close()
		End
	End Sub
	
	
	Private Sub sample14_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		Call JMPCINT2()
	End Sub
	
	
	Private Sub sample14_FormClosed(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
		Call JMPCINT3()
	End Sub
	
	Private Sub kouza_b_KeyPress(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.KeyPressEventArgs) Handles kouza_b.KeyPress
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