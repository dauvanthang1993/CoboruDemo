Option Strict Off
Option Explicit On
Friend Class ERROR_H
	Inherits System.Windows.Forms.Form
	
	
	
	'�n�j�{�^��
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		Me.Close()
	End Sub
	
	Private Sub ERROR_H_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		
		Select Case err_code
			Case 1
				err_m.Text = "�����ԍ������͂���Ă��܂���B"
			Case 2
				err_m.Text = "�Ïؔԍ������͂���Ă��܂���B"
			Case 3
				err_m.Text = "�o���z�����͂���Ă��܂���B"
			Case 4
				err_m.Text = "�����z�����͂���Ă��܂���B"
			Case 5
				err_m.Text = "���������͂���Ă��܂���B"
			Case 6
				err_m.Text = "�V�K�����z�����͂���Ă܂���B"
			Case 7
				err_m.Text = "�����ԍ���������܂���B"
			Case 8
				err_m.Text = "�Ïؔԍ����Ⴂ�܂��B"
			Case 9
				err_m.Text = "�����z���}�C�i�X�ɂȂ�܂��B"
			Case 10
				err_m.Text = "���z�̐������I�[�o�[���܂��B"
			Case 11
				err_m.Text = "�����͂���ȏ���܂���B"
		End Select
		
	End Sub
End Class