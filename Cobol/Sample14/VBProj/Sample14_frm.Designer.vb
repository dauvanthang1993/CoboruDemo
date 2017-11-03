<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> Partial Class sample14
#Region "Windows フォーム デザイナによって生成されたコード "
	<System.Diagnostics.DebuggerNonUserCode()> Public Sub New()
		MyBase.New()
		'この呼び出しは、Windows フォーム デザイナで必要です。
		InitializeComponent()
	End Sub
	'Form は、コンポーネント一覧に後処理を実行するために dispose をオーバーライドします。
	<System.Diagnostics.DebuggerNonUserCode()> Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
		If Disposing Then
			If Not components Is Nothing Then
				components.Dispose()
			End If
		End If
		MyBase.Dispose(Disposing)
	End Sub
	'Windows フォーム デザイナで必要です。
	Private components As System.ComponentModel.IContainer
	Public ToolTip1 As System.Windows.Forms.ToolTip
	Public WithEvents Command3 As System.Windows.Forms.Button
	Public WithEvents Command2 As System.Windows.Forms.Button
	Public WithEvents Command1 As System.Windows.Forms.Button
	Public WithEvents ansyo_b As System.Windows.Forms.TextBox
	Public WithEvents kouza_b As System.Windows.Forms.TextBox
	Public WithEvents Label3 As System.Windows.Forms.Label
	Public WithEvents Label2 As System.Windows.Forms.Label
	Public WithEvents Label1 As System.Windows.Forms.Label
	'メモ: 以下のプロシージャは Windows フォーム デザイナで必要です。
	'Windows フォーム デザイナを使って変更できます。
	'コード エディタを使用して、変更しないでください。
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(sample14))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.Command3 = New System.Windows.Forms.Button
		Me.Command2 = New System.Windows.Forms.Button
		Me.Command1 = New System.Windows.Forms.Button
		Me.ansyo_b = New System.Windows.Forms.TextBox
		Me.kouza_b = New System.Windows.Forms.TextBox
		Me.Label3 = New System.Windows.Forms.Label
		Me.Label2 = New System.Windows.Forms.Label
		Me.Label1 = New System.Windows.Forms.Label
		Me.SuspendLayout()
		Me.ToolTip1.Active = True
		Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
		Me.Text = "口座番号暗証番号入力"
		Me.ClientSize = New System.Drawing.Size(226, 113)
		Me.Location = New System.Drawing.Point(236, 198)
		Me.MaximizeBox = False
		Me.MinimizeBox = False
		Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.ControlBox = True
		Me.Enabled = True
		Me.KeyPreview = False
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.ShowInTaskbar = True
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "sample14"
		Me.Command3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.Command3.Text = "終了"
		Me.Command3.Size = New System.Drawing.Size(65, 25)
		Me.Command3.Location = New System.Drawing.Point(152, 80)
		Me.Command3.TabIndex = 6
		Me.Command3.BackColor = System.Drawing.SystemColors.Control
		Me.Command3.CausesValidation = True
		Me.Command3.Enabled = True
		Me.Command3.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Command3.Cursor = System.Windows.Forms.Cursors.Default
		Me.Command3.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Command3.TabStop = True
		Me.Command3.Name = "Command3"
		Me.Command2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.Command2.Text = "ＯＫ"
		Me.Command2.Size = New System.Drawing.Size(65, 25)
		Me.Command2.Location = New System.Drawing.Point(80, 80)
		Me.Command2.TabIndex = 5
		Me.Command2.BackColor = System.Drawing.SystemColors.Control
		Me.Command2.CausesValidation = True
		Me.Command2.Enabled = True
		Me.Command2.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Command2.Cursor = System.Windows.Forms.Cursors.Default
		Me.Command2.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Command2.TabStop = True
		Me.Command2.Name = "Command2"
		Me.Command1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.Command1.Text = "新規口座"
		Me.Command1.Size = New System.Drawing.Size(65, 25)
		Me.Command1.Location = New System.Drawing.Point(8, 80)
		Me.Command1.TabIndex = 4
		Me.Command1.BackColor = System.Drawing.SystemColors.Control
		Me.Command1.CausesValidation = True
		Me.Command1.Enabled = True
		Me.Command1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Command1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Command1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Command1.TabStop = True
		Me.Command1.Name = "Command1"
		Me.ansyo_b.AutoSize = False
		Me.ansyo_b.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
		Me.ansyo_b.Font = New System.Drawing.Font("ＭＳ Ｐゴシック", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(128, Byte))
		Me.ansyo_b.Size = New System.Drawing.Size(105, 25)
		Me.ansyo_b.IMEMode = System.Windows.Forms.ImeMode.Disable
		Me.ansyo_b.Location = New System.Drawing.Point(96, 40)
		Me.ansyo_b.Maxlength = 4
		Me.ansyo_b.PasswordChar = ChrW(42)
		Me.ansyo_b.TabIndex = 3
		Me.ansyo_b.AcceptsReturn = True
		Me.ansyo_b.BackColor = System.Drawing.SystemColors.Window
		Me.ansyo_b.CausesValidation = True
		Me.ansyo_b.Enabled = True
		Me.ansyo_b.ForeColor = System.Drawing.SystemColors.WindowText
		Me.ansyo_b.HideSelection = True
		Me.ansyo_b.ReadOnly = False
		Me.ansyo_b.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.ansyo_b.MultiLine = False
		Me.ansyo_b.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.ansyo_b.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.ansyo_b.TabStop = True
		Me.ansyo_b.Visible = True
		Me.ansyo_b.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.ansyo_b.Name = "ansyo_b"
		Me.kouza_b.AutoSize = False
		Me.kouza_b.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
		Me.kouza_b.Font = New System.Drawing.Font("ＭＳ Ｐゴシック", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(128, Byte))
		Me.kouza_b.Size = New System.Drawing.Size(105, 25)
		Me.kouza_b.IMEMode = System.Windows.Forms.ImeMode.Off
		Me.kouza_b.Location = New System.Drawing.Point(96, 8)
		Me.kouza_b.Maxlength = 5
		Me.kouza_b.TabIndex = 2
		Me.kouza_b.AcceptsReturn = True
		Me.kouza_b.BackColor = System.Drawing.SystemColors.Window
		Me.kouza_b.CausesValidation = True
		Me.kouza_b.Enabled = True
		Me.kouza_b.ForeColor = System.Drawing.SystemColors.WindowText
		Me.kouza_b.HideSelection = True
		Me.kouza_b.ReadOnly = False
		Me.kouza_b.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.kouza_b.MultiLine = False
		Me.kouza_b.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.kouza_b.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.kouza_b.TabStop = True
		Me.kouza_b.Visible = True
		Me.kouza_b.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.kouza_b.Name = "kouza_b"
		Me.Label3.Size = New System.Drawing.Size(9, 9)
		Me.Label3.Location = New System.Drawing.Point(104, 152)
		Me.Label3.TabIndex = 7
		Me.Label3.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label3.BackColor = System.Drawing.SystemColors.Control
		Me.Label3.Enabled = True
		Me.Label3.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label3.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label3.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label3.UseMnemonic = True
		Me.Label3.Visible = True
		Me.Label3.AutoSize = False
		Me.Label3.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label3.Name = "Label3"
		Me.Label2.TextAlign = System.Drawing.ContentAlignment.TopCenter
		Me.Label2.Text = "暗証番号"
		Me.Label2.Size = New System.Drawing.Size(89, 17)
		Me.Label2.Location = New System.Drawing.Point(0, 48)
		Me.Label2.TabIndex = 1
		Me.Label2.BackColor = System.Drawing.SystemColors.Control
		Me.Label2.Enabled = True
		Me.Label2.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label2.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label2.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label2.UseMnemonic = True
		Me.Label2.Visible = True
		Me.Label2.AutoSize = False
		Me.Label2.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label2.Name = "Label2"
		Me.Label1.TextAlign = System.Drawing.ContentAlignment.TopCenter
		Me.Label1.Text = "口座番号"
		Me.Label1.Font = New System.Drawing.Font("ＭＳ Ｐゴシック", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(128, Byte))
		Me.Label1.Size = New System.Drawing.Size(89, 17)
		Me.Label1.Location = New System.Drawing.Point(0, 16)
		Me.Label1.TabIndex = 0
		Me.Label1.BackColor = System.Drawing.SystemColors.Control
		Me.Label1.Enabled = True
		Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label1.UseMnemonic = True
		Me.Label1.Visible = True
		Me.Label1.AutoSize = False
		Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label1.Name = "Label1"
		Me.Controls.Add(Command3)
		Me.Controls.Add(Command2)
		Me.Controls.Add(Command1)
		Me.Controls.Add(ansyo_b)
		Me.Controls.Add(kouza_b)
		Me.Controls.Add(Label3)
		Me.Controls.Add(Label2)
		Me.Controls.Add(Label1)
		Me.ResumeLayout(False)
		Me.PerformLayout()
	End Sub
#End Region 
End Class