$RegistryPath = 'HKEY_USERS\.DEFAULT\Software\Microsoft\MouseWithoutBorders'
$Name         = 'myKeyDate'

Write-Host "`nExisting `"myKeyDate`" Registry Value:"
Write-Host "-----------------------------------"

$RegistryKey = Get-ItemProperty -Path "REGISTRY::$($RegistryPath)" -Name $Name
Write-Host "`nKey Generation Date (Base64):"
Write-Host "$($RegistryKey.myKeyDate)" -ForegroundColor Green

$DecodedString = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String("$($RegistryKey.myKeyDate)"))
Write-Host "`nKey Generation Date:"
Write-Host "$($DecodedString)" -ForegroundColor Green