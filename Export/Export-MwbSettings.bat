@ECHO OFF 

cd "%USERPROFILE%"

reg.exe export "HKEY_USERS\.DEFAULT\Software\Microsoft\MouseWithoutBorders" "MouseWithoutBorders_Settings.reg"

PAUSE