# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
write-host "Chocolatey installed"

Set-ExecutionPolicy unrestricted
# Postman block
#Download
$Postmanurl = "https://dl.pstmn.io/download/latest/win64"
$postoutpath = "$PSScriptRoot/PostmanSetup.exe"
Invoke-WebRequest -Uri $Postmanurl -OutFile $postoutpath
#Install
$args = @("Comma","Separated","Arguments")
write-host "Installing Postman"
Start-Process -Filepath "$PSScriptRoot/PostmanSetup.exe" -ArgumentList $args
write-host "Postman Installed"


# gitbash block
choco install git -params '"/GitAndUnixToolsOnPath"'
write-host "Git Installed"


#Desktop image block
Function Set-WallPaper($Image) {
<#
.SYNOPSIS
Applies a specified wallpaper to the current user's desktop
   
.PARAMETER Image
Provide the exact path to the image
 
.EXAMPLE
Set-WallPaper -Image "C:\Wallpaper\Default.jpg"
 
#>
 
Add-Type -TypeDefinition @" 
using System; 
using System.Runtime.InteropServices;
 
public class Params
{ 
    [DllImport("User32.dll",CharSet=CharSet.Unicode)] 
    public static extern int SystemParametersInfo (Int32 uAction, 
                                                   Int32 uParam, 
                                                   String lpvParam, 
                                                   Int32 fuWinIni);
}
"@ 
 
$SPI_SETDESKWALLPAPER = 0x0014
$UpdateIniFile = 0x01
$SendChangeEvent = 0x02
 
$fWinIni = $UpdateIniFile -bor $SendChangeEvent
 
$ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
}
Set-WallPaper -Image "$PSScriptRoot/Dz4pvqiU0AAVppC.jpg"