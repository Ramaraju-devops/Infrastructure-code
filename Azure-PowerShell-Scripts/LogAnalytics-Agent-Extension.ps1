#Connecting selected virtual machines to Log Analytics workspace 
#On the basis of evaluation, it will push the extension in the machine.
#This script needs a .txt file listing the name of virtual machines in which Azure Monitoring Extension needs to be added

#Enter parameters here
$SubscriptionId = "*********************"
$FilePath = "C:\Temp\Test.txt"
$WorkspaceName = "***************"
$WorkspaceResourceGroupName = "***************"

#Connecting to Azure
Connect-AzAccount

Set-AzContext -subscription $SubscriptionId

#Fetching workspace Id
$WorkspaceId = (Get-AzOperationalInsightsWorkspace -Name $WorkspaceName -ResourceGroupName $WorkspaceResourceGroupName).CustomerId.Guid

#Fetching workspace key
$WorkspaceKey = (Get-AzOperationalInsightsWorkspaceSharedKey -Name $WorkspaceName -ResourceGroupName $WorkspaceResourceGroupName).PrimarySharedKey

$PublicSettings = New-Object psobject | Add-Member -PassThru NoteProperty workspaceId $WorkspaceId | ConvertTo-Json
$protectedSettings = New-Object psobject | Add-Member -PassThru NoteProperty workspaceKey $WorkspaceKey | ConvertTo-Json

#Fetching the VM names 
$text = Get-Content -path $FilePath

For($i=0; $i -lt $text.Length; $i++)
{

"";Write-Host "Evaluating for machine:" $text[$i]

$vm = Get-AzVM -Name $text[$i]

if(!$vm)
{

""; Write-Host $text[$i] ": does not exist"

}

else
{

""; Write-Host "Checking the availability of Azure Monitoring Extension"

$VMExtension = Get-AzVMExtension -VMName $vm.Name -ResourceGroupName $vm.ResourceGroupName

if($VMExtension.Publisher -eq "Microsoft.EnterpriseCloud.Monitoring")

{

""; Write-Host "Azure Monitoring Extension already present in" $vm.Name

}

else
{

""; Write-Host "Azure Monitoring Extension not found in" $vm

if($vm.storageprofile.OsDisk.OsType -eq "Windows")
{

""; Write-Host "Detected Windows operating system in" $vm.Name

""; Write-Host "Setting up Microsoft Monitoring Agent"

#Adding Microsoft Monitoring Agent
Set-AzVMExtension -ResourceGroupName $vm.ResourceGroupName -VMName $vm.Name -ExtensionName "MicrosoftMonitoringAgent" -Publisher "Microsoft.EnterpriseCloud.Monitoring" -ExtensionType "MicrosoftMonitoringAgent" -TypeHandlerVersion '1.0' -Location $vm.Location -SettingString $PublicSettings -ProtectedSettingString $protectedSettings

""; Write-Host "Microsoft Monitoring Agent added to" $vm.Name

}

else
{

""; Write-Host "Detected Linux operating system for" $vm.Name

""; Write-Host "Setting up OmsAgentForLinux"

#Adding OmsAgentForLinux
Set-AzVMExtension -ResourceGroupName $vm.ResourceGroupName -VMName $vm.Name -Name "OmsAgentForLinux" -Publisher "Microsoft.EnterpriseCloud.Monitoring" -ExtensionType "OmsAgentForLinux" -TypeHandlerVersion '1.0' -Location $vm.Location -SettingString $PublicSettings -ProtectedSettingString $protectedSettings

""; Write-Host "OmsAgentForLinux added to" $vm.Name

}

}

}
}

""; Write-Host "Azure Monitoring Extension added for all selected machines"
