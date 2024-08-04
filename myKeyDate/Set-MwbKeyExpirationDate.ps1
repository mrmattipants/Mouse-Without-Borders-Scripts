$RegistryPath = 'HKEY_USERS\.DEFAULT\Software\Microsoft\MouseWithoutBorders'
$Name         = 'myKeyDate'

$Date = get-date -format "M-d-yyyy"
#$Date = "4/4/2024"

$StringBytes = [System.Text.Encoding]::Unicode.GetBytes($Date)
$EncodedString = [Convert]::ToBase64String($StringBytes)

New-ItemProperty -Path "REGISTRY::$($RegistryPath)" -Name $Name -Value $EncodedString -PropertyType String -Force | Out-Null

Write-Host "`nNew `"myKeyDate`" Registry Value:"
Write-Host "------------------------------"

$RegistryKey = Get-ItemProperty -Path "REGISTRY::$($RegistryPath)" -Name $Name
Write-Host "`nmyKeyDate (Encoded):"
Write-Host "$($RegistryKey.myKeyDate)" -ForegroundColor Green

$DecodedString = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String("$($RegistryKey.myKeyDate)"))
Write-Host "`nmyKeyDate (Decoded):"
Write-Host "$($DecodedString)" -ForegroundColor Green