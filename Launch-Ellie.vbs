' Ellie Background Launcher (No CMD Window)
' Double-clicking this starts Ellie directly in the background.
' You can close any CMD or terminal window and Ellie will keep running!

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("WScript.Shell")
strCurrentDir = objFSO.GetParentFolderName(WScript.ScriptFullName)

strExePath = strCurrentDir & "\dist\win-unpacked\Ellie Desktop Companion.exe"

If Not objFSO.FileExists(strExePath) Then
    strExePath = strCurrentDir & "\dist\Ellie Desktop Companion 1.0.0.exe"
End If

If objFSO.FileExists(strExePath) Then
    ' 0 = Hide window (completely background, no console window at all)
    objShell.Run """" & strExePath & """", 0, False
Else
    ' Fallback to electron development runner detached
    objShell.Run "cmd /c cd /d """ & strCurrentDir & """ && start """" npx electron .", 0, False
End If
