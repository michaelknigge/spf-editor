@echo off

rem Pass two parameters:
rem
rem   Parameter 1: the SPF/SE 365 build number
rem   Parameter 2: the AppVeyor build number

if X%1==X (
   echo Parameter 1 is missing
   exit 1
)

if X%2==X (
   echo Parameter 2 is missing
   exit 1
)

echo *****************************************************
echo *****************************************************
echo *****************************************************
echo ***  Building installer for SPF/SE 365 Build %1 ***
echo *****************************************************
echo *****************************************************
echo *****************************************************

rem Installing from original MSI package
msiexec /i binaries\SPFSE365-%1.msi /q /log SPFSE365-%1.log

rem Sleep a little bit (10 seconds... installation of SPF/SE 365 is very fast)
timeout /t 10

rem Building the installer using InnoSetup
"C:\Program Files (x86)\Inno Setup 6\iscc.exe" spfse-365-%1.iss /DAppveyorBuildNumber=%2
