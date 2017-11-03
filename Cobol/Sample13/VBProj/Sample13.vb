Option Strict Off
Option Explicit On
Friend Class form1
	Inherits System.Windows.Forms.Form
	Private Declare Sub sample13 Lib "sample13.DLL"  Alias "SAMPLE13"(ByRef ar As Short, ByRef br As Short, ByVal C As String)
    Private Declare Sub JMPCINT2 Lib "F3BIPRCT.DLL" ()
    Private Declare Sub JMPCINT3 Lib "F3BIPRCT.DLL" ()
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		Dim br As Short
        Dim b As String
		Dim ar As Short
        Dim a As String
		
		Static C As New VB6.FixedLengthString(11)
        a = Text1.Text
        ar = Val(a)
        b = Text2.Text
        br = Val(b)
		Call sample13(ar, br, C.Value)
		Text3.Text = C.Value
		
	End Sub
	
	
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		Me.Close()
		End
	End Sub
	
	Private Sub Command3_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command3.Click
		Text1.Text = ""
		Text2.Text = ""
		Text3.Text = ""
	End Sub
	
	
	Private Sub form1_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		Call JMPCINT2()
	End Sub
	
	
	Private Sub form1_FormClosed(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
		Call JMPCINT3()
	End Sub
End Class