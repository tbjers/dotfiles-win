Import-Module "${env:HOME}\scoop\buckets\extras\scripts\ModifyPSProfile.psm1"
Remove-ProfileContent 'Import-Module scoop-completion'
Add-ProfileContent 'Import-Module scoop-completion'
Remove-Module -Name ModifyPSProfile
