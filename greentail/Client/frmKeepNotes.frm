VERSION 5.00
Begin VB.Form frmKeepNotes 
   BorderStyle     =   0  'None
   Caption         =   "Player Notes"
   ClientHeight    =   6000
   ClientLeft      =   45
   ClientTop       =   0
   ClientWidth     =   6000
   Icon            =   "frmKeepNotes.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   Picture         =   "frmKeepNotes.frx":014A
   ScaleHeight     =   6000
   ScaleWidth      =   6000
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Close 
      Appearance      =   0  'Flat
      Caption         =   "Close Notes"
      Height          =   300
      Left            =   2160
      TabIndex        =   2
      Top             =   5130
      Width           =   2055
   End
   Begin VB.CommandButton Save 
      Appearance      =   0  'Flat
      BackColor       =   &H00789298&
      Caption         =   "Save Notes"
      Height          =   300
      Left            =   240
      MaskColor       =   &H00789298&
      TabIndex        =   1
      Top             =   5130
      Width           =   1935
   End
   Begin VB.TextBox Notetext 
      Appearance      =   0  'Flat
      Height          =   3870
      Left            =   240
      TabIndex        =   0
      Top             =   1200
      Width           =   3960
   End
End
Attribute VB_Name = "frmKeepNotes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Close_Click()
frmKeepNotes.Visible = False
End Sub

Private Sub Form_Load()
Dim i As Long
Dim Ending As String
    For i = 1 To 3
        If i = 1 Then Ending = ".GIF"
        If i = 2 Then Ending = ".JPG"
        If i = 3 Then Ending = ".PNG"
 
        If FileExist("GUI\Notes" & Ending) Then frmKeepNotes.Picture = LoadPicture(App.Path & "\GUI\Notes" & Ending)
    Next i
End Sub

Private Sub Save_Click()
Dim iFileNum As Integer

'Get a free file handle
iFileNum = FreeFile

'If the file is not there, one will be created
'If the file does exist, this one will
'overwrite it.
Open App.Path & "\notes.txt" For Output As iFileNum

Print #iFileNum, Notetext.Text

Close iFileNum

End Sub

