#==========================================
# Title:  QuickStart - SetUp
# Author: Hung Truong, Jannik Junker
# Date:   27 March 2020
#==========================================

$quickstart_path = "$PSScriptRoot\QuickStart"
Write-Host "Create Directories"
if(!(Test-Path -Path $quickstart_path)){
    Write-Host "Create Quickstart Folder"
    New-Item -Path $quickstart_path -ItemType Directory
}
if(!(Test-Path -Path "$quickstart_path\Study")){
    Write-Host "Create Study Folder"
    New-Item -Path "$quickstart_path\Study" -ItemType Directory
}
if(!(Test-Path -Path "$quickstart_path\Study\Close")){
    Write-Host "Create Study\Close Folder"
    New-Item -Path "$quickstart_path\Study\Close" -ItemType Directory
}
if(!(Test-Path -Path "$quickstart_path\Study\Open")){
    Write-Host "Create Study\Open Folder"
    New-Item -Path "$quickstart_path\Study\Open" -ItemType Directory
}
if(!(Test-Path -Path "$quickstart_path\Study\Desktop")){
    Write-Host "Create Study\Desktop Folder"
    New-Item -Path "$quickstart_path\Study\Desktop" -ItemType Directory
}
if(!(Test-Path -Path "$quickstart_path\Study\Signature")){
    Write-Host "Create Study\Signature Folder"
    New-Item -Path "$quickstart_path\Study\Signature" -ItemType Directory
}
if(!(Test-Path -Path "$quickstart_path\Work")){
    Write-Host "Create Work Folder"
    New-Item -Path "$quickstart_path\Work" -ItemType Directory
}
if(!(Test-Path -Path "$quickstart_path\Work\Close")){
    Write-Host "Create Work\Close Folder"
    New-Item -Path "$quickstart_path\Work\Close" -ItemType Directory
}
if(!(Test-Path -Path "$quickstart_path\Work\Open")){
    Write-Host "Create Work\Open Folder"
    New-Item -Path "$quickstart_path\Work\Open" -ItemType Directory
}
if(!(Test-Path -Path "$quickstart_path\Work\Desktop")){
    Write-Host "Create Work\Desktop Folder"
    New-Item -Path "$quickstart_path\Work\Desktop" -ItemType Directory
}
if(!(Test-Path -Path "$quickstart_path\Work\Signature")){
    Write-Host "Create Work\Signature Folder"
    New-Item -Path "$quickstart_path\Work\Signature" -ItemType Directory
}
Write-Host "Done"

