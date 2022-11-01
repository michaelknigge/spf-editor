#define AppName         "SPF SourceEdit 365"
#define AppBuildNumber  "3454"
#define AdminSubkey     "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
#define UserSubkey      "Environment"
#define InstallDir      "C:\Program Files (x86)\SPFSE365\Graphic"

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
OutputBaseFilename=SPFSE-365.{#AppBuildNumber}.{#AppveyorBuildNumber}-SETUP

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
Source: "{#InstallDir}\Bin\*";       DestDir: "{app}\Bin";          Flags: replacesameversion restartreplace
Source: "{#InstallDir}\Dialogs\*";   DestDir: "{app}\Dialogs";      Flags: replacesameversion restartreplace
Source: "{#InstallDir}\Help\*";      DestDir: "{app}\Help";         Flags: replacesameversion restartreplace
Source: "{#InstallDir}\Macros\*";    DestDir: "{app}\Macros";       Flags: replacesameversion restartreplace
Source: "{#InstallDir}\Profiles\*";  DestDir: "{app}\Profiles";     Flags: replacesameversion restartreplace

Source: "icons-v365\*.ico"; DestDir: "{app}\Bin";      Flags: replacesameversion restartreplace
Source: "dialogs-v365\*";   DestDir: "{app}\Dialogs";  Flags: replacesameversion restartreplace
Source: "macros\*";         DestDir: "{app}\Macros";   Flags: replacesameversion restartreplace

Source: "profiles-v365\*";  DestDir: "{autoappdata}\SPF-Options"; Flags: replacesameversion restartreplace;

#include "fonts.iss"

[Registry]
Root: HKLM; Check: IsAdminInstallMode;     Subkey: "{#AdminSubkey}"; ValueType: string; ValueName: "SPFGE365";   ValueData: "{app}";                     Flags: uninsdeletevalue
Root: HKLM; Check: IsAdminInstallMode;     Subkey: "{#AdminSubkey}"; ValueType: string; ValueName: "SPFGE365RW"; ValueData: "{autoappdata}\SPF-Options"; Flags: uninsdeletevalue

Root: HKCU; Check: not IsAdminInstallMode; Subkey: "{#UserSubkey}";  ValueType: string; ValueName: "SPFGE365";   ValueData: "{app}";                     Flags: uninsdeletevalue
Root: HKCU; Check: not IsAdminInstallMode; Subkey: "{#UserSubkey}";  ValueType: string; ValueName: "SPFGE365RW"; ValueData: "{autoappdata}\SPF-Options"; Flags: uninsdeletevalue

[Icons]
Name: "{group}\{#AppName}";  Filename: "{app}\Bin\SPF80GE.exe"; IconFilename: "{app}\Bin\SPF80GE.ico"
Name: "{group}\Uninstall";   Filename: "{uninstallexe}"

Check: IsAdminInstallMode;     Name: "{commondesktop}\SPFSE 365"; Filename: "{app}\Bin\SPF80GE.exe"; IconFilename: "{app}\Bin\SPF80GE.ico"; Tasks: desktopicon
Check: not IsAdminInstallMode; Name: "{userdesktop}\SPFSE 365";   Filename: "{app}\Bin\SPF80GE.exe"; IconFilename: "{app}\Bin\SPF80GE.ico"; Tasks: desktopicon

[Code]
function GetDefaultDirName(Param: String): String;
begin
  if IsAdminInstallMode then
    Result := ExpandConstant('{pf}') + '\{#AppName}'
  else
    Result := GetEnv('LOCALAPPDATA') + '\{#AppName}'
end;
