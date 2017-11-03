Option Strict Off
Option Explicit On
Module Module1
	Declare Sub K_KEN Lib "k_ken.DLL" (ByRef kouza As Integer, ByRef ansyo As Short, ByVal namae As String, ByRef tyo_kin As Integer, ByRef err_code As Short)
	Declare Sub K_NYU Lib "k_ken.DLL" (ByRef kouza As Integer, ByRef nyu_kin As Integer, ByRef tyo_kin As Integer, ByRef err_code As Short)
	Declare Sub K_SYU Lib "k_ken.DLL" (ByRef kouza As Integer, ByRef syu_kin As Integer, ByRef tyo_kin As Integer, ByRef err_code As Short)
	Declare Sub K_SIN Lib "k_ken.DLL" (ByVal namae As String, ByRef tyo_kin As Integer, ByRef ansyo As Short, ByVal kouza_s As String, ByRef err_code As Short)
	
    Declare Sub JMPCINT2 Lib "f3biprct.dll" ()
    Declare Sub JMPCINT3 Lib "f3biprct.dll" ()
	
	Public kouza As Integer
	Public kouza_t As String
	Public ansyo As Short
	Public err_code As Short
	Public namae_t As String
	Public tyo_kin As Integer
	Public nyu_kin As Integer
	Public syu_kin As Integer
End Module