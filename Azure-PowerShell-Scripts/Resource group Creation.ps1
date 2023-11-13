Login-AzAccount
Select-AzSubscription -Subscription "subscription-name"
New-AzResourceGroup -Location "West Europe" -Name resourcegroupname -Tag @{IteraplanID="*******"; Owner="********"; Owner_Email="****@***"; Environment = "Production" } -Force
