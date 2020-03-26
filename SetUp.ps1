#==========================================
# Title:  QuickStart - SetUp
# Author: Hung Truong, Jannik Junker
# Date:   26 March 2020
#==========================================

$quickstart_path = "$PSScriptRoot\QuickStart"
Write-Host "Create Directories"
New-Item -Path '$quickstart_path\Study' -ItemType Directory
New-Item -Path '$quickstart_path\Study\Close' -ItemType Directory
New-Item -Path '$quickstart_path\Study\Open' -ItemType Directory
New-Item -Path '$quickstart_path\Study\Desktop' -ItemType Directory
New-Item -Path '$quickstart_path\Study\Signature' -ItemType Directory
New-Item -Path '$quickstart_path\Work' -ItemType Directory
New-Item -Path '$quickstart_path\Work\Close' -ItemType Directory
New-Item -Path '$quickstart_path\Work\Open' -ItemType Directory
New-Item -Path '$quickstart_path\Work\Desktop' -ItemType Directory
New-Item -Path '$quickstart_path\Work\Signature' -ItemType Directory
Write-Host "Done"

