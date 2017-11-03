<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> Partial Class SELE
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
	Public WithEvents tyokin_g As System.Windows.Forms.TextBox
	Public WithEvents na_mae As System.Windows.Forms.TextBox
	Public WithEvents kouza_b As System.Windows.Forms.TextBox
	Public WithEvents Label3 As System.Windows.Forms.Label
	Public WithEvents Label2 As System.Windows.Forms.Label
	Public WithEvents Label1 As System.Windows.Forms.Label
	'メモ: 以下のプロシージャは Windows フォーム デザイナで必要です。
	'Windows フォーム デザイナを使って変更できます。
	'コード エディタを使用して、変更しないでください。
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(SELE))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.Command3 = New System.Windows.Forms.Button
		Me.Command2 = New System.Windows.Forms.Button
		Me.Command1 = New System.Windows.Forms.Button
		Me.tyokin_g = New System.Windows.Forms.TextBox
		Me.na_mae = New System.Windows.Forms.TextBox
		Me.kouza_b = New System.Windows.Forms.TextBox
		Me.Label3 = New System.Windows.Forms.Label
		Me.Label2 = New System.Windows.Forms.Label
		Me.Label1 = New System.Windows.Forms.Label
		Me.SuspendLayout()
		Me.ToolTip1.Active = True
		Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
		Me.Text = "口座番号、氏名、貯金額表示"
		Me.ClientSize = New System.Drawing.Size(225, 146)
		Me.Location = New System.Drawing.Point(237, 178)
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
		Me.Name = "SELE"
		Me.Command3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.Command3.Text = "ｷｬﾝｾﾙ"
		Me.Command3.Size = New System.Drawing.Size(65, 25)
		Me.Command3.Location = New System.Drawing.Point(152, 112)
		Me.Command3.TabIndex = 8
		Me.Command3.BackColor = System.Drawing.SystemColors.Control
		Me.Command3.CausesValidation = True
		Me.Command3.Enabled = True
		Me.Command3.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Command3.Cursor = System.Windows.Forms.Cursors.Default
		Me.Command3.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Command3.TabStop = True
		Me.Command3.Name = "Command3"
		Me.Command2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.Command2.Text = "入金"
		Me.Command2.Size = New System.Drawing.Size(65, 25)
		Me.Command2.Location = New System.Drawing.Point(80, 112)
		Me.Command2.TabIndex = 7
		Me.Command2.BackColor = System.Drawing.SystemColors.Control
		Me.Command2.CausesValidation = True
		Me.Command2.Enabled = True
		Me.Command2.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Command2.Cursor = System.Windows.Forms.Cursors.Default
		Me.Command2.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Command2.TabStop = True
		Me.Command2.Name = "Command2"
		Me.Command1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.Command1.Text = "出金"
		Me.Command1.Size = New System.Drawing.Size(65, 25)
		Me.Command1.Location = New System.Drawing.Point(8, 112)
		Me.Command1.TabIndex = 6
		Me.Command1.BackColor = System.Drawing.SystemColors.Control
		Me.Command1.CausesValidation = True
		Me.Command1.Enabled = True
		Me.Command1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Command1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Command1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Command1.TabStop = True
		Me.Command1.Name = "Command1"
		Me.tyokin_g.AutoSize = False
		Me.tyokin_g.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
		Me.tyokin_g.Font = New System.Drawing.Font("ＭＳ Ｐゴシック", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(128, Byte))
		Me.tyokin_g.Size = New System.Drawing.Size(113, 25)
		Me.tyokin_g.Location = New System.Drawing.Point(96, 72)
		Me.tyokin_g.ReadOnly = True
		Me.tyokin_g.TabIndex = 5
		Me.tyokin_g.TabStop = False
		Me.tyokin_g.AcceptsReturn = True
		Me.tyokin_g.BackColor = System.Drawing.SystemColors.Window
		Me.tyokin_g.CausesValidation = True
		Me.tyokin_g.Enabled = True
		Me.tyokin_g.ForeColor = System.Drawing.SystemColors.WindowText
		Me.tyokin_g.HideSelection = True
		Me.tyokin_g.Maxlength = 0
		Me.tyokin_g.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.tyokin_g.MultiLine = False
		Me.tyokin_g.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.tyokin_g.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.tyokin_g.Visible = True
		Me.tyokin_g.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.tyokin_g.Name = "tyokin_g"
		Me.na_mae.AutoSize = False
		Me.na_mae.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
		Me.na_mae.Font = New System.Drawing.Font("ＭＳ Ｐゴシック", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(128, Byte))
		Me.na_mae.Size = New System.Drawing.Size(113, 25)
		Me.na_mae.Location = New System.Drawing.Point(96, 40)
		Me.na_mae.ReadOnly = True
		Me.na_mae.TabIndex = 3
		Me.na_mae.TabStop = False
		Me.na_mae.AcceptsReturn = True
		Me.na_mae.BackColor = System.Drawing.SystemColors.Window
		Me.na_mae.CausesValidation = True
		Me.na_mae.Enabled = True
		Me.na_mae.ForeColor = System.Drawing.SystemColors.WindowText
		Me.na_mae.HideSelection = True
		Me.na_mae.Maxlength = 0
		Me.na_mae.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.na_mae.MultiLine = False
		Me.na_mae.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.na_mae.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.na_mae.Visible = True
		Me.na_mae.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.na_mae.Name = "na_mae"
		Me.kouza_b.AutoSize = False
		Me.kouza_b.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
		Me.kouza_b.Font = New System.Drawing.Font("ＭＳ Ｐゴシック", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(128, Byte))
		Me.kouza_b.Size = New System.Drawing.Size(113, 25)
		Me.kouza_b.Location = New System.Drawing.Point(96, 8)
		Me.kouza_b.ReadOnly = True
		Me.kouza_b.TabIndex = 1
		Me.kouza_b.TabStop = False
		Me.kouza_b.AcceptsReturn = True
		Me.kouza_b.BackColor = System.Drawing.SystemColors.Window
		Me.kouza_b.CausesValidation = True
		Me.kouza_b.Enabled = True
		Me.kouza_b.ForeColor = System.Drawing.SystemColors.WindowText
		Me.kouza_b.HideSelection = True
		Me.kouza_b.Maxlength = 0
		Me.kouza_b.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.kouza_b.MultiLine = False
		Me.kouza_b.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.kouza_b.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.kouza_b.Visible = True
		Me.kouza_b.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.kouza_b.Name = "kouza_b"
		Me.Label3.TextAlign = System.Drawing.ContentAlignment.TopCenter
		Me.Label3.Text = "貯金額"
		Me.Label3.Size = New System.Drawing.Size(73, 17)
		Me.Label3.Location = New System.Drawing.Point(8, 80)
		Me.Label3.TabIndex = 4
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
		Me.Label2.Text = "氏名"
		Me.Label2.Size = New System.Drawing.Size(49, 17)
		Me.Label2.Location = New System.Drawing.Point(16, 48)
		Me.Label2.TabIndex = 2
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
		Me.Label1.Size = New System.Drawing.Size(73, 17)
		Me.Label1.Location = New System.Drawing.Point(8, 16)
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
		Me.Controls.Add(tyokin_g)
		Me.Controls.Add(na_mae)
		Me.Controls.Add(kouza_b)
		Me.Controls.Add(Label3)
		Me.Controls.Add(Label2)
		Me.Controls.Add(Label1)
		Me.ResumeLayout(False)
		Me.PerformLayout()
	End Sub
#End Region 
End Class