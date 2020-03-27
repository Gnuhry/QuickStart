#==========================================
# Title:  QuickStart
# Author: Hung Truong, Jannik Junker
# Date:   25 March 2020
#==========================================

$path_desktop = "D:\Users\BKU\HungTruong\Desktop"
$path_signature = "D:\Users\BKU\HungTruong\AppData(Roaming)\Microsoft\Signatures"
$path_outlook = "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"
$path_bookmark = "C:\Users\HungTruong\AppData\Local\Google\Chrome\User Data\Default\Bookmarks"
$path_chrome = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

$quickstart_path = "$PSScriptRoot\QuickStart"
$path_show_desktop = "$quickstart_path\Show_Desktop.ps1"
$path_work = "$quickstart_path\Work\Desktop"
$path_study = "$quickstart_path\Study\Desktop"
$path_open_work = "$quickstart_path\Work\Open"
$path_open_study = "$quickstart_path\Study\Open"
$path_close_work = "$quickstart_path\Work\Close"
$path_close_study = "$quickstart_path\Study\Close"
$path_signature_work = "$quickstart_path\Work\Signature"
$path_signature_study = "$quickstart_path\Study\Signature"
$path_bookmark_work = "$quickstart_path\Work\Bookmarks"
$path_bookmark_study = "$quickstart_path\Study\Bookmarks"

# $path_taskbar = "D:\Users\BKU\HungTruong\AppData(Roaming)\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"
# $path_taskbar_none = "D:\Users\BKU\HungTruong\Documents\QuickStart\_TaskLeiste\None"
# $path_taskbar_work = "D:\Users\BKU\HungTruong\Documents\QuickStart\_TaskLeiste\Arbeit"
# $path_taskbar_study = "D:\Users\BKU\HungTruong\Documents\QuickStart\_TaskLeiste\Studium"


function DeleteFromDesktop($delete_files_path) {
    Write-Host "---------DeleteFromDesktop-------------------"
    $delete_files=Get-ChildItem -Path $delete_files_path
    $desktop_files=Get-ChildItem -Path $path_desktop
    foreach ($delete_file in $delete_files){
        Write-Host "Removing $delete_file"
        foreach ($file_desktop in $desktop_files){
            if(([string]$file_desktop) -eq ([string]$delete_file)){
                Write-Host "--removed $file_desktop"
                Remove-Item -Path "$path_desktop\$file_desktop"
            }
        }
    }
}
function AddToDesktop($adding_files_path) {
    Write-Host "----------AddToDesktop----------------------"
    $adding_files=Get-ChildItem -Path $adding_files_path
    $desktop_files=Get-ChildItem -Path $path_desktop
    foreach ($adding_file in $adding_files){
        Write-Host "Adding $adding_file"
        $bool=1
        foreach ($file_desktop in $desktop_files){
            #Write-Host $file_desktop
            if(([string]$file_desktop) -eq ([string]$adding_file)){
                Write-Host "--Found"
                $bool=0
                break
            }
        }
        if($bool -eq 1){
            Write-Host "--Not Found"
            Copy-Item -Path "$adding_files_path\$adding_file" -Destination "$path_desktop\$adding_file"

        }
    }
}
function OpenFile($opening_files_path) {
    Write-Host "-----------OpenFile-------------------------"
    $opening_files=Get-ChildItem -Path $opening_files_path
    foreach($opening_file in $opening_files){
        $temp=([string]$opening_file).Split(".")[0]+".exe"
        Write-Host "Open $temp"
        if(([string] (tasklist /fi "imagename eq $temp")).Contains("INFORMATION"))
        {
            Write-Host "--opening"
            Start-Process "$opening_files_path\$opening_file" 
        }
        else{
            Write-Host "--is open"
        }
    }

}

function CloseFile($closing_files_path) {
    Write-Host "----------CloseFile-------------------------"
    $closing_files=Get-ChildItem -Path $closing_files_path
    foreach($closing_file in $closing_files){
        $temp=([string]$closing_file).Split(".")[0]
        Write-Host "Close $temp"
        if(([string] (tasklist /fi "imagename eq $temp.exe")).Contains("INFORMATION"))
        {
            Write-Host "--is closed"
        }
        else{
            Write-Host "--closing"
            Stop-Process -Name "$temp"
        }
    }

}
function ChangeSignature($new_signature_path) {
    Write-Host "----------ChangeSignature-------------------------"
    if(!(([string] (tasklist /fi "imagename eq OUTLOOK.exe")).Contains("INFORMATION"))){
        Stop-Process -Name "OUTLOOK"
    }
    foreach ($file in (Get-ChildItem -Path $new_signature_path)) {
        Copy-Item -Path "$new_signature_path\$file" -Destination "$path_signature\$file" -Force
    }
    Start-Process $path_outlook -WindowStyle Hidden
}
function ChangeBookmarkChrome($new_bookmark_path) {
    Write-Host "----------ChangeBookmarkChrome-------------------------"
    if(!(([string] (tasklist /fi "imagename eq chrome.exe")).Contains("INFORMATION"))){
        Stop-Process -Name "chrome"
    }
    Copy-Item -Path "$new_bookmark_path" -Destination "$path_bookmark" -Force
    Start-Process $path_chrome
}
# function RestartExplorer{
#     Stop-Process -Name "explorer"
#     Start-Process "C:\Windows\explorer.exe"
# }

# function ReplaceTaskBar($replacing_taskbar_path){
#     Remove-Item -Path $path_taskbar
#     foreach ($replacing_file in $replacing_taskbar_path){
#         Copy-Item -Path "$replacing_taskbar_path\$replacing_file" -Destination "$path_taskbar\$replacing_file"
#     }
#     RestartExplorer
# }





$option = Read-Host "0 - Nothing
1 - Work
2 - Study"
Switch($option) {
    0{
        DeleteFromDesktop($path_work)
        DeleteFromDesktop($path_study)
        CloseFile($path_close_work)
        CloseFile($path_close_study)
        # ReplaceTaskBar($path_taskbar_none)
    }
    1{
        ChangeSignature($path_signature_work)
        ChangeBookmarkChrome($path_bookmark_work)
        CloseFile($path_close_work)
        OpenFile($path_open_work)
        DeleteFromDesktop($path_study)
        AddToDesktop($path_work)
        # ReplaceTaskBar($path_taskbar_work)
    }
    2{
        ChangeSignature($path_signature_study)
        ChangeBookmarkChrome($path_bookmark_study)
        CloseFile($path_close_study)
        OpenFile($path_open_study)
        DeleteFromDesktop($path_work)
        AddToDesktop($path_study)
        # ReplaceTaskBar($path_taskbar_study)
    }
}
Start-Sleep -Seconds 5
Write-Host "Show Desktop"
Start-Process $path_show_desktop
exit





