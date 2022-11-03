#define AppName         "SPF SourceEdit 7.0"
#define AppBuildNumber  "1723"
#define AdminSubkey     "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
#define UserSubkey      "Environment"
#define InstallDir      "C:\Program Files (x86)\SPF70\Graphic"

[Setup]
AppName={#AppName}
AppVerName={#AppName} Build {#AppBuildNumber}.{#AppveyorBuildNumber}
AppPublisher=Command Technology Corporation
AppPublisherURL=https://github.com/michaelknigge/spf-editor
AppCopyright=Copyright (C) Command Technology Corporation
DefaultGroupName={#AppName}
DefaultDirName={code:GetDefaultDirName}
OutputDir=.
ChangesEnvironment=yes
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog commandline
OutputBaseFilename=SPFSE-7.0.{#AppBuildNumber}.{#AppveyorBuildNumber}-SETUP

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"

[Dirs]
Name: "{autoappdata}\SPF-Options";         Permissions: everyone-modify;
Name: "{app}\Macros";                      Permissions: everyone-modify;
Name: "{app}\Dialogs";                     Permissions: everyone-modify;

[Tasks]
Name: "desktopicon"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; Description: "{cm:CreateDesktopIcon}"
Name: "fonts";       GroupDescription: "Additional fonts";     Flags: unchecked; Description: "Install TrueType font ""Source Code Pro"""

[Files]
Source: "{#InstallDir}\bin\*";       DestDir: "{app}\bin";          Flags: replacesameversion restartreplace
Source: "{#InstallDir}\dialogs\*";   DestDir: "{app}\dialogs";      Flags: replacesameversion restartreplace
Source: "{#InstallDir}\help\*";      DestDir: "{app}\help";         Flags: replacesameversion restartreplace
Source: "{#InstallDir}\macros\*";    DestDir: "{app}\macros";       Flags: replacesameversion restartreplace
Source: "{#InstallDir}\profiles\*";  DestDir: "{app}\profiles";     Flags: replacesameversion restartreplace

Source: "icons-v7\*.ico";   DestDir: "{app}\Bin";      Flags: replacesameversion restartreplace
Source: "dialogs-v7\*";     DestDir: "{app}\Dialogs";  Flags: replacesameversion restartreplace
Source: "macros\*";         DestDir: "{app}\Macros";   Flags: replacesameversion restartreplace

Source: "profiles-v7\*";    DestDir: "{autoappdata}\SPF-Options"; Flags: replacesameversion restartreplace;

#include "fonts.iss"

[Registry]
Root: HKLM; Check: IsAdminInstallMode;     Subkey: "{#AdminSubkey}"; ValueType: string; ValueName: "SPFGE365";   ValueData: "{app}";                     Flags: uninsdeletevalue
Root: HKLM; Check: IsAdminInstallMode;     Subkey: "{#AdminSubkey}"; ValueType: string; ValueName: "SPFGE365RW"; ValueData: "{autoappdata}\SPF-Options"; Flags: uninsdeletevalue

Root: HKCU; Check: not IsAdminInstallMode; Subkey: "{#UserSubkey}";  ValueType: string; ValueName: "SPFGE365";   ValueData: "{app}";                     Flags: uninsdeletevalue
Root: HKCU; Check: not IsAdminInstallMode; Subkey: "{#UserSubkey}";  ValueType: string; ValueName: "SPFGE365RW"; ValueData: "{autoappdata}\SPF-Options"; Flags: uninsdeletevalue

[Icons]
Name: "{group}\{#AppName}";  Filename: "{app}\bin\GraphicEdition.exe"; IconFilename: "{app}\bin\GraphicEdition.ico"
Name: "{group}\Uninstall";   Filename: "{uninstallexe}"

Check: IsAdminInstallMode;     Name: "{commondesktop}\SPFSE 7.0"; Filename: "{app}\Bin\SPF80GE.exe"; IconFilename: "{app}\bin\GraphicEdition.ico"; Tasks: desktopicon
Check: not IsAdminInstallMode; Name: "{userdesktop}\SPFSE 7.0";   Filename: "{app}\Bin\SPF80GE.exe"; IconFilename: "{app}\bin\GraphicEdition.ico"; Tasks: desktopicon

[Code]
function GetDefaultDirName(Param: String): String;
begin
  if IsAdminInstallMode then
    Result := ExpandConstant('{pf}') + '\{#AppName}'
  else
    Result := GetEnv('LOCALAPPDATA') + '\{#AppName}'
end;
