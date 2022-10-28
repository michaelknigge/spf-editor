@echo off

rem Pass two parameters:
rem
rem   Parameter 1: the SPF/SE 6.0 build number
rem   Parameter 2: the AppVeyor build number

if X%1==X (
   echo Parameter 1 is missing
   exit 1
)

if X%2==X (
   echo Parameter 2 is missing
   exit 1
)

rem Extracting the distribution ZIP file
if exist temp1 rmdir /S /Q temp1
mkdir temp1
"C:\Program Files\7-Zip\7z.exe" e binaries\disk-spf-60-%1.zip -otemp1

rem Extracting the graphic edition from the distribution
if exist temp2 rmdir /S /Q temp1
mkdir temp2
"C:\Program Files\7-Zip\7z.exe" e temp1\spfge60.zip -otemp2

rem Extracting the graphic edition binaries
if exist orig-bin rmdir /S /Q orig-bin
mkdir orig-bin
"C:\Program Files\7-Zip\7z.exe" e temp2\bin.zip -oorig-bin

rem Extracting the graphic edition dialogs
if exist orig-dialogs rmdir /S /Q orig-dialogs
mkdir orig-dialogs
"C:\Program Files\7-Zip\7z.exe" e temp2\dialogs.zip -oorig-dialogs

rem Extracting the graphic edition help files
if exist orig-help rmdir /S /Q orig-help
mkdir orig-help
"C:\Program Files\7-Zip\7z.exe" e temp2\help.zip -oorig-help

rem Extracting the graphic edition macros
if exist orig-macros rmdir /S /Q orig-macros
mkdir orig-macros
"C:\Program Files\7-Zip\7z.exe" e temp2\macros.zip -oorig-macros

rem Extracting the graphic edition file profiles
if exist orig-profiles rmdir /S /Q orig-profiles
mkdir orig-profiles
"C:\Program Files\7-Zip\7z.exe" e temp2\profiles.zip -oorig-profiles

rem Building the installer using InnoSetup
"C:\Program Files (x86)\Inno Setup 6\iscc.exe" spfse-60-%1.iss /DAppveyorBuildNumber=%2
