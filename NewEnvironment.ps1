<# 
.DESCRIPTION 

Copies existing environment files to create a new one.

Renames all environment variable files to create a new environment

.EXAMPLE 
Run the script from an elevated PowerShell prompt inside the existing environment directory.

Pass in the name of the existing environment and the desired name of the new environment.

.NOTES
Version:        1.0
Author:         Brandon J. Lashmet
Creation Date:  4/14/2020
Purpose/Change: Creating new environment in a multicloud project.

#>

[CmdletBinding()]

    Param(

        [Parameter(Mandatory=$true)]
        [string] $CurrentEnvironment,

        [Parameter(Mandatory=$true)]
        [string] $NewEnvironment
    )


#Copy existing environment folders\files to new environment folder

$SourceRoot = (Get-Location).Path

$DestinationRoot = ..\\$SourceRoot\\$NewEnvironment

Copy-Item -Path $SourceRoot -Recurse -Destination $DestinationRoot -WhatIf

Get-ChildItem ("*" + $OldEnvironment + "*") -Recurse | Rename-Item -NewName { $_.Name -replace $CurrentEnvironment,$NewEnvironment } -WhatIf