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

function Generate-RunwayEnvironment{

    Param(

        [Parameter(Mandatory=$true)]
        [string] $CurrentEnvironment,

        [Parameter(Mandatory=$true)]
        [string] $NewEnvironment
    )

#Copy existing environment folders\files to new environment folder

#For testing
$CurrentEnvironment = "dev"
$NewEnvironment = "qa"

#Gets current working directory, should be environment directory if using the module correctly.
$SourceRoot = (Get-Location).Path

#Defines destination root as the parent directory of the current working directory.
#Intended to create a new environment directory in the same parent directory as the current environment.
$DestinationRoot = ((Get-Item -Path $SourceRoot | Select-Object Parent).Parent).FullName + "\" + $NewEnvironment

#Create the new environment directory if it does not exist.
if(!(Test-Path $DestinationRoot)) {New-Item $DestinationRoot -ItemType Directory -Force}

#Copy all folders and files from the current environment directory to the new one.
Copy-Item -Path "$SourceRoot\*" -Recurse -Destination $DestinationRoot

#Change to the new environment directory 
cd $DestinationRoot

#Rename all environment variable files with the new environment name.
$EnvironmentVariableFiles = Get-ChildItem ("*" + $CurrentEnvironment + "*") -Recurse

ForEach ($File in $EnvironmentVariableFiles){

        Write-Host "Replacing $($CurrentEnvironment) with $($NewEnvironment) in $($File.FullName)"


                try{
        
                    Rename-Item -Path $($File.FullName) -NewName ($($File.Name) -replace $CurrentEnvironment, $NewEnvironment)

                }

                catch{

                    Write-Host "Exception is:"

                    $_.Exception.Message

                    Write-Host "Item is:"

                    $FailedItem = $_.Exception.ItemName

                }

}




#Get file list and replace instances of old environment with instances of new environment. Ignore .terraform folders.
$FileList = @(Get-ChildItem -File -Recurse  | Where-Object { ($_.FullName -NotMatch ".terraform") -and ($_.FullName -NotMatch ".zip") -and ($_.FullName -NotMatch "hooks") }).FullName

Write-Host "File List is:"

$FileList

ForEach ($File in $FileList)

    {

        try{
        
            $FileContent = [System.IO.File]::ReadAllText($File).Replace("$CurrentEnvironment","$NewEnvironment")

            [System.IO.File]::WriteAllText($File, $FileContent)

            Write-Host "Replaced $($CurrentEnvironment) with $($NewEnvironment) in:"

            Write-Host "$File"

        }

        catch{

            Write-Host "Exception is:"

            $_.Exception.Message

            Write-Host "Item is:"

            $FailedItem = $_.Exception.ItemName

        }

    }

}