#define AppName         "SPF SourceEdit 365"
#define AppBuildNumber  "3454"
#define AdminSubkey     "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
#define UserSubkey      "Environment"
#define InstallDir      "C:\Program Files (x86)\SPFSE365\Graphic"

[Setup]
AppName={#AppName}
AppVerName={#AppName} Build {#AppBuildNumber}
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
Name: "desktopicon";     Description: "{cm:CreateDesktopIcon}";     GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#InstallDir}\Bin\*";       DestDir: "{app}\Bin";          Flags: replacesameversion restartreplace
Source: "{#InstallDir}\Dialogs\*";   DestDir: "{app}\Dialogs";      Flags: replacesameversion restartreplace
Source: "{#InstallDir}\Help\*";      DestDir: "{app}\Help";         Flags: replacesameversion restartreplace
Source: "{#InstallDir}\Macros\*";    DestDir: "{app}\Macros";       Flags: replacesameversion restartreplace
Source: "{#InstallDir}\Profiles\*";  DestDir: "{app}\Profiles";     Flags: replacesameversion restartreplace

Source: "dialogs\*";        DestDir: "{app}\Dialogs";  Flags: replacesameversion restartreplace; Excludes: "about.dlg"
Source: "macros\*";         DestDir: "{app}\Macros";   Flags: replacesameversion restartreplace

Source: "profiles-v365\*";  DestDir: "{autoappdata}\SPF-Options"; Flags: replacesameversion restartreplace;

[Registry]
Root: HKLM; Check: IsAdminInstallMode;     Subkey: "{#AdminSubkey}"; ValueType: string; ValueName: "SPFGE365";   ValueData: "{app}";                     Flags: uninsdeletevalue
Root: HKLM; Check: IsAdminInstallMode;     Subkey: "{#AdminSubkey}"; ValueType: string; ValueName: "SPFGE365RW"; ValueData: "{autoappdata}\SPF-Options"; Flags: uninsdeletevalue

Root: HKCU; Check: not IsAdminInstallMode; Subkey: "{#UserSubkey}";  ValueType: string; ValueName: "SPFGE365";   ValueData: "{app}";                     Flags: uninsdeletevalue
Root: HKCU; Check: not IsAdminInstallMode; Subkey: "{#UserSubkey}";  ValueType: string; ValueName: "SPFGE365RW"; ValueData: "{autoappdata}\SPF-Options"; Flags: uninsdeletevalue

[Icons]
Name: "{group}\{#AppName}";  Filename: "{app}\bin\SPFGE80.exe";
Name: "{group}\Uninstall";   Filename: "{uninstallexe}"

[Icons]
Check: IsAdminInstallMode;     Name: "{commondesktop}\{#AppName}"; Filename: "{app}\bin\SPFGE80.exe"; Tasks: desktopicon
Check: not IsAdminInstallMode; Name: "{userdesktop}\{#AppName}";   Filename: "{app}\bin\SPFGE80.exe"; Tasks: desktopicon

[Code]
function GetDefaultDirName(Param: String): String;
begin
  if IsAdminInstallMode then
    Result := ExpandConstant('{pf}') + '\{#AppName}'
  else
    Result := GetEnv('LOCALAPPDATA') + '\{#AppName}'
end;
