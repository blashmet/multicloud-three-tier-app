<# 
.DESCRIPTION 

Changes to specified $Module\$Environment folder.

.EXAMPLE 
Run the script from an elevated PowerShell prompt inside the existing environment directory.

Pass in the name of the existing environment and the desired name of the new environment.

.NOTES
Version:        1.0
Author:         Brandon J. Lashmet
Creation Date:  4/14/2020
Purpose/Change: Creating new environment in a multicloud project.

#>

function Initialize-TerraformWorkspace{

    Param(

        [Parameter(Mandatory=$true)]
        [bool] $AllModules = $true,

        [Parameter(Mandatory=$false)]
        [array] $ModuleList = @(),

        [Parameter(Mandatory=$true)]
        [string] $Environment
    )


    #For testing
    #$Module = "vpc"
    #$Environment = "dev"
    #

    #Import YAML parser
    Install-Module -Name powershell-yaml -Force -Repository PSGallery -Scope CurrentUser

    #Import runway.yml file to detect available Terraform\CF modules

    [string[]]$RunwayYamlContent = Get-Content "runway.yml"
    $YamlConstructor = ''
    ForEach ($line in $RunwayYamlContent) { $YamlConstructor = $YamlConstructor + "`n" + $line }
    $YamlPSObject = ConvertFrom-YAML $YamlConstructor

    #Load available modules from runway.yml
    $AvailableModules = @($YamlPSObject.Deployments.modules.path)

    $AvailableModules = $AvailableModules | Select-Object -Unique | Where-Object {$_ -match ".tf"}

        if($AllModules -eq $true)

            {

                ForEach ($module in $AvailableModules)

                    {

                        cd $module
                        Write-Host "Current directory is..."
                        Write-Host $(pwd).Path

                        try{

                            terraform workspace new $Environment; terraform workspace select $Environment; terraform init
                            cd ..

                        }

                        catch{

                            Write-Host "Exception is:"

                            $_.Exception.Message
                
                            Write-Host "Item is:"
                
                            $FailedItem = $_.Exception.ItemName
                            cd ..

                        }

                    }

                
            }

        else{

            ForEach ($module in $ModuleList)

            {

                cd $module

                try{

                    terraform workspace new $Environment; terraform workspace select $Environment; terraform init

                }

                catch{

                    Write-Host "Exception is:"

                    $_.Exception.Message
        
                    Write-Host "Item is:"
        
                    $FailedItem = $_.Exception.ItemName

                }

            }

        }

}