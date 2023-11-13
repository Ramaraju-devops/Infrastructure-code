## This Script will check all the storageAccounts and disable the Blob Public Access 

#Connect-AzAccount

Select-AzSubscription -Subscription 13917d14-a7e0-4435-8830-403a28246744

$ResourceGroups = Get-AzResourceGroup

Write-Output $ResourceGroups.name

$RGnames = $ResourceGroups.ResourceGroupName


foreach ($RGname in $RGnames)
{
    Write-Output $RGname
    $StorageAccount = Get-AzResource -ResourceGroupName $RGname -ResourceType "Microsoft.Storage/storageAccounts"

    $StorageAccountNames = $StorageAccount.Name

        foreach ($StorageAccountName in $StorageAccountNames)
            
            {
            $Status = (Get-AzStorageAccount -Name $StorageAccountName -ResourceGroupName $RGname ).AllowBlobPublicAccess

            Write-Host "$StorageAccountName - $Status"

            if($Status -eq "True")
                {
                    
                    Set-AzStorageAccount  -AccountName $StorageAccountName `
                      -ResourceGroupName $RGname `
                     -AllowBlobPublicAccess $false

                     Write-Host "$StorageAccountName - $Status"
                }
           
               else
                {

                    Write-Host "$StorageAccountName AllowBlobPublicAccess is Already Disabled"
                }

                
             }


}
