#Connect-AzAccount

Select-AzSubscription -SubscriptionId *******************************

New-AzResourceGroupDeployment -Name AlertDeploymentLnxlogcdiskPrct -ResourceGroupName resourcegroupname `
  -TemplateFile templatefile-path\template.json -TemplateParameterFile \parameters-file-path\Parameters.json
  
